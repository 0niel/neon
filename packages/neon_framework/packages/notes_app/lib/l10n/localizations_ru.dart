import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class NotesLocalizationsRu extends NotesLocalizations {
  NotesLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get errorChangedOnServer => 'Заметка была изменена на сервере. Пожалуйста, обновите и попробуйте снова.';

  @override
  String get general => 'Общее';

  @override
  String get notes => 'Заметки';

  @override
  String get note => 'Заметка';

  @override
  String get noteCreate => 'Создать заметку';

  @override
  String get noteTitle => 'Заголовок';

  @override
  String get noteSetCategory => 'Установить категорию';

  @override
  String get noteChangeCategory => 'Изменить категорию заметки';

  @override
  String get noteShowEditor => 'Редактировать заметку';

  @override
  String get noteShowPreview => 'Предварительный просмотр заметки';

  @override
  String get noteStar => 'Добавить в избранное';

  @override
  String get noteUnstar => 'Убрать из избранного';

  @override
  String noteDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить заметку \'$name\'?';
  }

  @override
  String get categories => 'Категории';

  @override
  String get category => 'Категория';

  @override
  String categoryNotesCount(int count) {
    return '$count заметок';
  }

  @override
  String get categoryUncategorized => 'Без категории';

  @override
  String get optionsDefaultCategory => 'Категория по умолчанию';

  @override
  String get optionsDefaultNoteViewType => 'Как показывать заметку';

  @override
  String get optionsDefaultNoteViewTypePreview => 'Предварительный просмотр';

  @override
  String get optionsDefaultNoteViewTypeEdit => 'Редактор';

  @override
  String get optionsNotesSortOrder => 'Порядок сортировки заметок';

  @override
  String get optionsNotesSortProperty => 'Как сортировать заметки';

  @override
  String get optionsNotesSortPropertyLastModified => 'Последнее изменение';

  @override
  String get optionsNotesSortPropertyAlphabetical => 'Алфавитно';

  @override
  String get optionsCategoriesSortOrder => 'Порядок сортировки категорий';

  @override
  String get optionsCategoriesSortProperty => 'Как сортировать категории';

  @override
  String get optionsCategoriesSortPropertyAlphabetical => 'Алфавитно';

  @override
  String get optionsCategoriesSortPropertyNotesCount => 'Количество заметок';
}
