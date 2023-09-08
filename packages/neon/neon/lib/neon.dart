import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:neon/src/app.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/first_launch.dart';
import 'package:neon/src/blocs/next_push.dart';
import 'package:neon/src/blocs/push_notifications.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:neon/src/theme/neon.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:neon/src/utils/user_agent.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

Future<void> runNeon({
  required final Iterable<AppImplementation> appImplementations,
  required final NeonTheme theme,
  @visibleForTesting final WidgetsBinding? bindingOverride,
  @visibleForTesting final Account? account,
  @visibleForTesting final bool firstLaunchDisabled = false,
  @visibleForTesting final bool nextPushDisabled = false,
}) async {
  final binding = bindingOverride ?? WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await NeonPlatform.setup();
  await RequestManager.instance.initCache();
  await NeonStorage.init();

  final packageInfo = await PackageInfo.fromPlatform();
  buildUserAgent(packageInfo);

  final globalOptions = GlobalOptions(
    packageInfo,
  );

  final accountsBloc = AccountsBloc(
    globalOptions,
    appImplementations,
  );
  if (account != null) {
    accountsBloc
      ..addAccount(account)
      ..setActiveAccount(account);
  }
  final pushNotificationsBloc = PushNotificationsBloc(
    accountsBloc,
    globalOptions,
  );
  final firstLaunchBloc = FirstLaunchBloc(
    disabled: firstLaunchDisabled,
  );
  final nextPushBloc = NextPushBloc(
    accountsBloc,
    globalOptions,
    disabled: nextPushDisabled,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<GlobalOptions>(
          create: (final _) => globalOptions,
          dispose: (final _, final globalOptions) => globalOptions.dispose(),
        ),
        Provider<AccountsBloc>(
          create: (final _) => accountsBloc,
          dispose: (final _, final accountsBloc) => accountsBloc.dispose(),
        ),
        Provider<PushNotificationsBloc>(
          create: (final _) => pushNotificationsBloc,
          dispose: (final _, final pushNotificationsBloc) => pushNotificationsBloc.dispose(),
        ),
        Provider<FirstLaunchBloc>(
          create: (final _) => firstLaunchBloc,
          dispose: (final _, final firstLaunchBloc) => firstLaunchBloc.dispose(),
        ),
        Provider<NextPushBloc>(
          create: (final _) => nextPushBloc,
          dispose: (final _, final nextPushBloc) => nextPushBloc.dispose(),
        ),
        Provider<Iterable<AppImplementation>>(
          create: (final _) => appImplementations,
          dispose: (final _, final appImplementations) {
            for (final app in appImplementations) {
              app.dispose();
            }
          },
        ),
        Provider<PackageInfo>(
          create: (final _) => packageInfo,
        ),
      ],
      child: NeonApp(neonTheme: theme),
    ),
  );
}
