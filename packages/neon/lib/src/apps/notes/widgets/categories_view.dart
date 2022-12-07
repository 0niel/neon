part of '../app.dart';

class NotesCategoriesView extends StatelessWidget {
  const NotesCategoriesView({
    required this.bloc,
    super.key,
  });

  final NotesBloc bloc;

  @override
  Widget build(final BuildContext context) => ResultBuilder<NotesBloc, List<NotesNote>>(
        stream: bloc.notes,
        builder: (final context, final notes) => SortBoxBuilder<CategoriesSortProperty, NoteCategory>(
          sortBox: categoriesSortBox,
          sortPropertyOption: bloc.options.categoriesSortPropertyOption,
          sortBoxOrderOption: bloc.options.categoriesSortBoxOrderOption,
          input: notes.data
              ?.map((final note) => note.category)
              .toSet()
              .map(
                (final category) => NoteCategory(
                  category,
                  notes.data!.where((final note) => note.category == category).length,
                ),
              )
              .toList(),
          builder: (final context, final sorted) => CustomListView<NoteCategory>(
            scrollKey: 'notes-categories',
            items: sorted,
            isLoading: notes.loading,
            error: notes.error,
            onRetry: () async {
              await bloc.refresh();
            },
            onRefresh: () async {
              await bloc.refresh();
            },
            builder: _buildCategory,
          ),
        ),
      );

  Widget _buildCategory(
    final BuildContext context,
    final NoteCategory category,
  ) =>
      ListTile(
        title: Text(category.name != '' ? category.name : AppLocalizations.of(context).notesUncategorized),
        subtitle: Text(AppLocalizations.of(context).notesNotesInCategory(category.count)),
        leading: category.name != ''
            ? Icon(
                MdiIcons.tag,
                size: 40,
                color: NotesCategoryColor.compute(category.name),
              )
            : const SizedBox(
                height: 40,
                width: 40,
              ),
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (final context) => NotesCategoryPage(
                bloc: bloc,
                category: category,
              ),
            ),
          );
        },
      );
}
