import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_rich_text/neon_rich_text.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:notifications_app/l10n/localizations.dart';
import 'package:notifications_app/src/widgets/action.dart';
import 'package:notifications_app/src/widgets/notification.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import 'testing.dart';

void main() {
  late notifications.Notification notification;
  late void Function() callback;
  late Account account;
  late MockUrlLauncher urlLauncher;

  setUpAll(() {
    registerFallbackValue(const LaunchOptions());

    urlLauncher = MockUrlLauncher();
    // ignore: discarded_futures
    when(() => urlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    UrlLauncherPlatform.instance = urlLauncher;
  });

  setUp(() {
    FakeNeonStorage.setup();

    final primaryAction = MockAction();
    when(() => primaryAction.label).thenReturn('primary');
    when(() => primaryAction.primary).thenReturn(true);

    final secondaryAction = MockAction();
    when(() => secondaryAction.label).thenReturn('secondary');
    when(() => secondaryAction.primary).thenReturn(false);

    notification = MockNotification();
    when(() => notification.notificationId).thenReturn(0);
    when(() => notification.app).thenReturn('app');
    when(() => notification.subject).thenReturn('subject');
    when(() => notification.subjectRichParameters).thenReturn(BuiltMap());
    when(() => notification.message).thenReturn('message');
    when(() => notification.messageRichParameters).thenReturn(BuiltMap());
    when(() => notification.datetime).thenReturn(tz.TZDateTime.now(tz.UTC).toIso8601String());
    when(() => notification.actions).thenReturn(BuiltList([primaryAction, secondaryAction]));
    when(() => notification.icon).thenReturn('/icon');
    when(() => notification.link).thenReturn('/link');

    callback = MockCallbackFunction<void>().call;

    account = MockAccount();
  });

  testWidgets('Plain', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        child: NotificationsNotification(
          notification: notification,
          onDelete: callback,
        ),
      ),
    );

    expect(find.byType(NeonUriImage), findsOne);
    expect(find.text('message'), findsOne);
    expect(find.text('subject'), findsOne);
    expect(find.text('now'), findsOne);
    expect(find.byType(NotificationsAction), findsExactly(2));
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/notification_plain.png'));

    await tester.tap(find.byType(NotificationsNotification));
    verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);

    await tester.drag(find.byType(NotificationsNotification), const Offset(500, 0));
    await tester.pumpAndSettle();
    verify(callback.call).called(1);
  });

  testWidgets('Rich', (tester) async {
    when(() => notification.subjectRich).thenReturn('subject {user}');
    when(() => notification.subjectRichParameters).thenReturn(
      BuiltMap({
        'user': BuiltMap<String, JsonObject>({
          'type': JsonObject('user'),
          'id': JsonObject('user'),
          'name': JsonObject('user'),
        }),
      }),
    );
    when(() => notification.messageRich).thenReturn('message {call}');
    when(() => notification.messageRichParameters).thenReturn(
      BuiltMap({
        'call': BuiltMap<String, JsonObject>({
          'type': JsonObject('call'),
          'id': JsonObject('call'),
          'name': JsonObject('call'),
          'icon-url': JsonObject('call'),
        }),
      }),
    );

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        child: NotificationsNotification(
          notification: notification,
          onDelete: callback,
        ),
      ),
    );

    expect(find.byType(NeonRichObjectMention), findsExactly(2));
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/notification_rich.png'));
  });

  testWidgets('Without icon', (tester) async {
    when(() => notification.icon).thenReturn('');

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        child: NotificationsNotification(
          notification: notification,
          onDelete: callback,
        ),
      ),
    );

    expect(find.byType(NeonUriImage), findsNothing);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/notification_without_icon.png'));
  });
}
