import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';

/// Bloc for handling the message state and interactions.
@sealed
abstract class TalkMessageBloc implements Bloc {
  /// Creates a new Talk message bloc.
  factory TalkMessageBloc({
    required spreed.$ChatMessageInterface chatMessage,
    required ReferencesBloc referencesBloc,
    required bool isParent,
  }) = _TalkMessageBloc;

  /// References contained in the message.
  BehaviorSubject<BuiltMap<String, Result<core.Reference>>> get references;
}

class _TalkMessageBloc extends Bloc implements TalkMessageBloc {
  _TalkMessageBloc({
    required this.chatMessage,
    required this.referencesBloc,
    required this.isParent,
  }) {
    if (!isParent) {
      referenceRegexSubscription = referencesBloc.referenceRegex.listen((result) {
        final referenceRegex = result.data;
        if (referenceRegex == null) {
          return;
        }

        matches = referenceRegex.allMatches(chatMessage.message).map((match) => match.group(0)!.trim()).toBuiltList();

        if (matches.isNotEmpty) {
          referencesBloc.loadReferences(matches);
        }
      });

      referencesSubscription = referencesBloc.references.listen((result) {
        references.add(
          BuiltMap({
            for (final entry in result.entries)
              if (matches.contains(entry.key)) entry.key: entry.value,
          }),
        );
      });
    }
  }

  final spreed.$ChatMessageInterface chatMessage;
  final ReferencesBloc referencesBloc;
  final bool isParent;
  BuiltList<String> matches = BuiltList();
  StreamSubscription<Result<RegExp?>>? referenceRegexSubscription;
  StreamSubscription<BuiltMap<String, Result<core.Reference>>>? referencesSubscription;

  @override
  Logger log = Logger('TalkMessageBloc');

  @override
  void dispose() {
    unawaited(referenceRegexSubscription?.cancel());
    unawaited(referencesSubscription?.cancel());
    unawaited(references.close());
  }

  @override
  final references = BehaviorSubject.seeded(BuiltMap());
}
