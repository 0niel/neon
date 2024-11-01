import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:rxdart/rxdart.dart';
import 'package:talk_app/src/blocs/message_bloc.dart';

import 'testing.dart';

void main() {
  registerFallbackValue(BuiltList<String>());

  late BehaviorSubject<BuiltMap<String, Result<core.Reference>>> references;
  late ReferencesBloc referencesBloc;
  late TalkMessageBloc bloc;

  setUp(() async {
    references = BehaviorSubject();
    referencesBloc = MockReferencesBloc();
    when(() => referencesBloc.referenceRegex).thenAnswer(
      (_) => BehaviorSubject.seeded(Result.success(RegExp('[a-z]+'))),
    );
    when(() => referencesBloc.references).thenAnswer((_) => references);

    final message = MockChatMessage();
    when(() => message.message).thenReturn('a b c');

    bloc = TalkMessageBloc(
      chatMessage: message,
      referencesBloc: referencesBloc,
      isParent: false,
    );
  });

  tearDown(() async {
    await references.close();
    bloc.dispose();
  });

  test('Resolves references', () async {
    verify(() => referencesBloc.loadReferences(BuiltList(['a', 'b', 'c']))).called(1);

    final openGraphObject = MockOpenGraphObject();
    when(() => openGraphObject.name).thenReturn('name');
    when(() => openGraphObject.link).thenReturn('/link');

    final reference = MockReference();
    when(() => reference.openGraphObject).thenReturn(openGraphObject);

    references.add(
      BuiltMap({
        'a': Result<core.Reference>.loading(),
        'b': Result.success(reference),
        'c': Result<core.Reference>.error('error'),
        'd': Result.success(reference),
      }),
    );
    expect(
      bloc.references,
      emitsInOrder(<BuiltMap<String, Result<core.Reference>>>[
        BuiltMap(),
        BuiltMap({
          'a': Result<core.Reference>.loading(),
          'b': Result.success(reference),
          'c': Result<core.Reference>.error('error'),
        }),
      ]),
    );

    await Future<void>.delayed(const Duration(milliseconds: 1));
  });
}
