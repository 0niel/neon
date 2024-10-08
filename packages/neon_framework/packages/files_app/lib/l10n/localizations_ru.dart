import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class FilesLocalizationsRu extends FilesLocalizations {
  FilesLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get actionDelete => 'Удалить';

  @override
  String get actionRename => 'Переименовать';

  @override
  String get actionMove => 'Переместить';

  @override
  String get actionCopy => 'Копировать';

  @override
  String get actionShare => 'Поделиться';

  @override
  String get errorUnableToOpenFile => 'Не удается открыть файл';

  @override
  String get general => 'Общее';

  @override
  String goToPath(String path) {
    return 'Перейти к /$path';
  }

  @override
  String get uploadFiles => 'Загрузить файлы';

  @override
  String get uploadImages => 'Загрузить изображения';

  @override
  String get uploadCamera => 'Загрузить с камеры';

  @override
  String uploadConfirmSizeWarning(String warningSize, String actualSize) {
    return 'Вы уверены, что хотите загрузить файл, который больше $warningSize ($actualSize)?';
  }

  @override
  String downloadConfirmSizeWarning(String warningSize, String actualSize) {
    return 'Вы уверены, что хотите скачать файл, который больше $warningSize ($actualSize)?';
  }

  @override
  String get actionDeleteTitle => 'Безвозвратно удалить?';

  @override
  String get filesChooseCreate => 'Добавить в Nextcloud';

  @override
  String get folderCreate => 'Создать папку';

  @override
  String get folderName => 'Имя папки';

  @override
  String get folderRename => 'Переименовать папку';

  @override
  String get folderChoose => 'Выбрать папку';

  @override
  String folderDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить папку \'$name\'?';
  }

  @override
  String get fileRename => 'Переименовать файл';

  @override
  String fileDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить файл \'$name\'?';
  }

  @override
  String get addToFavorites => 'Добавить в избранное';

  @override
  String get removeFromFavorites => 'Удалить из избранного';

  @override
  String get details => 'Детали';

  @override
  String get detailsFileName => 'Имя файла';

  @override
  String get detailsFolderName => 'Имя папки';

  @override
  String get detailsParentFolder => 'Родительская папка';

  @override
  String get detailsFileSize => 'Размер файла';

  @override
  String get detailsFolderSize => 'Размер папки';

  @override
  String get detailsLastModified => 'Последнее изменение';

  @override
  String get detailsIsFavorite => 'В избранном';

  @override
  String get optionsFilesSortProperty => 'Как сортировать файлы';

  @override
  String get optionsFilesSortPropertyName => 'Имя';

  @override
  String get optionsFilesSortPropertyModifiedDate => 'Последнее изменение';

  @override
  String get optionsFilesSortPropertySize => 'Размер';

  @override
  String get optionsFilesSortOrder => 'Порядок сортировки файлов';

  @override
  String get optionsShowHiddenFiles => 'Показать скрытые файлы';

  @override
  String get optionsUploadQueueParallelism => 'Параллелизм очереди загрузки';

  @override
  String get optionsDownloadQueueParallelism => 'Параллелизм очереди загрузки';

  @override
  String get optionsUploadSizeWarning => 'Предупреждение о размере загрузки';

  @override
  String get optionsDownloadSizeWarning => 'Предупреждение о размере загрузки';

  @override
  String get optionsSizeWarningDisabled => 'Отключено';
}
