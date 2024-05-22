import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/widgets/reactions.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:shared_preferences/shared_preferences.dart';

import 'testing.dart';

void main() {
  late spreed.ChatMessage chatMessage;
  late TalkRoomBloc bloc;

  setUp(() {
    chatMessage = MockChatMessage();
    when(() => chatMessage.reactions).thenReturn(BuiltMap({'😀': 1, '😊': 23}));
    when(() => chatMessage.reactionsSelf).thenReturn(BuiltList(['😊']));

    bloc = MockRoomBloc();
  });

  testWidgets('Reactions', (tester) async {
    await tester.pumpWidget(
      TestApp(
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );
    await expectLater(find.byType(TalkReactions), matchesGoldenFile('goldens/reactions.png'));
  });

  testWidgets('Add reaction', (tester) async {
    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );

    await tester.tap(find.text('😀'));

    verify(() => bloc.addReaction(chatMessage, '😀')).called(1);
  });

  testWidgets('Remove reaction', (tester) async {
    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );

    await tester.tap(find.text('😊'));

    verify(() => bloc.removeReaction(chatMessage, '😊')).called(1);
  });

  testWidgets('Add new reaction', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );

    await tester.runAsync(() async {
      await tester.tap(find.byIcon(Icons.add_reaction_outlined));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.tag_faces));
      await tester.pumpAndSettle();
      await tester.tap(find.text('😂'));
      await tester.pumpAndSettle();

      verify(() => bloc.addReaction(chatMessage, '😂')).called(1);
    });
  });
}
