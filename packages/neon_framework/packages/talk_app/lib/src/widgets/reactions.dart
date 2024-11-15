import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:talk_app/l10n/localizations.dart';
import 'package:talk_app/src/blocs/room.dart';
import 'package:talk_app/src/widgets/reactions_overview_dialog.dart';

/// Widget for displaying the current reactions on a chat message including the ability to add and remove reactions.
class TalkReactions extends StatelessWidget {
  /// Creates new Talk reactions.
  const TalkReactions({
    required this.room,
    required this.chatMessage,
    super.key,
  });

  /// {@macro TalkMessage.room}
  final spreed.Room room;

  /// The chat message to display the reactions for.
  final spreed.$ChatMessageInterface chatMessage;

  @override
  Widget build(BuildContext context) {
    final bloc = NeonProvider.of<TalkRoomBloc>(context);

    final canUpdateReactions = room.readOnly == 0 &&
        spreed.ParticipantPermission.values
            .byBinary(room.permissions)
            .contains(spreed.ParticipantPermission.canSendMessageAndShareAndReact);

    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    return MouseRegion(
      onEnter: (_) {
        bloc.loadReactions(chatMessage);
      },
      child: StreamBuilder(
        stream: bloc.reactions,
        builder: (context, reactionsSnapshot) {
          final reactions = reactionsSnapshot.data?[chatMessage.id];

          final children = <Widget>[];
          for (final reaction in chatMessage.reactions.entries) {
            final isSelf = chatMessage.reactionsSelf?.contains(reaction.key) ?? false;

            children.add(
              ActionChip(
                backgroundColor: isSelf ? Theme.of(context).colorScheme.primary : null,
                shape: shape,
                avatar: Text(reaction.key),
                label: Text(
                  reaction.value.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'monospace',
                    color: isSelf ? Theme.of(context).colorScheme.onPrimary : null,
                  ),
                ),
                tooltip: reactions?[reaction.key]?.map((r) => r.actorDisplayName).join(', ') ??
                    TalkLocalizations.of(context).reactionsLoading,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(
                  top: -2.5,
                  bottom: -2.5,
                  right: 10,
                ),
                onPressed: canUpdateReactions
                    ? () {
                        if (isSelf) {
                          bloc.removeReaction(chatMessage, reaction.key);
                        } else {
                          bloc.addReaction(chatMessage, reaction.key);
                        }
                      }
                    : null,
              ),
            );
          }

          if (canUpdateReactions) {
            children.add(
              ActionChip(
                shape: shape,
                avatar: Icon(
                  Icons.add_reaction_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  size: 16,
                ),
                label: const SizedBox(),
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(vertical: -2.5),
                tooltip: TalkLocalizations.of(context).reactionsAddNew,
                onPressed: () async {
                  final reaction = await showDialog<String>(
                    context: context,
                    builder: (context) => const NeonEmojiPickerDialog(),
                  );
                  if (reaction == null) {
                    return;
                  }

                  if (!context.mounted) {
                    return;
                  }

                  bloc.addReaction(chatMessage, reaction);
                },
              ),
            );
          }

          if (chatMessage.reactions.isNotEmpty) {
            children.add(
              ActionChip(
                shape: shape,
                avatar: Icon(
                  MdiIcons.heartOutline,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  size: 16,
                ),
                label: const SizedBox(),
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(vertical: -2.5),
                tooltip: TalkLocalizations.of(context).reactionsSeeAll,
                onPressed: () async {
                  await showDialog<void>(
                    context: context,
                    builder: (context) => NeonProvider.value(
                      value: bloc,
                      child: TalkReactionsOverviewDialog(
                        chatMessage: chatMessage,
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: children
                .intersperse(
                  const SizedBox(
                    width: 5,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
