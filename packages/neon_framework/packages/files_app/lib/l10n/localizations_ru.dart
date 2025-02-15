// ignore: unused_import
import 'package:intl/intl.dart' as intl;
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
  String get actionCopy => 'Скопировать';

  @override
  String get actionShare => 'Поделиться';

  @override
  String get errorUnableToOpenFile => 'Невозможно открыть файл';

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
    return 'Вы уверены, что хотите загрузить файл, размер которого превышает $warningSize ($actualSize)?';
  }

  @override
  String downloadConfirmSizeWarning(String warningSize, String actualSize) {
    return 'Вы уверены, что хотите скачать файл, размер которого превышает $warningSize ($actualSize)?';
  }

  @override
  String get actionDeleteTitle => 'Безвозвратно удалить?';

  @override
  String get filesChooseCreate => 'Добавить в Nextcloud';

  @override
  String get folderCreate => 'Создать папку';

  @override
  String get folderName => 'Название папки';

  @override
  String get folderRename => 'Переименовать папку';

  @override
  String get folderChoose => 'Выбрать папку';

  @override
  String folderDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить папку «$name»?';
  }

  @override
  String get fileRename => 'Переименовать файл';

  @override
  String fileDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить файл «$name»?';
  }

  @override
  String get addToFavorites => 'Добавить в избранное';

  @override
  String get removeFromFavorites => 'Удалить из избранного';

  @override
  String get details => 'Подробности';

  @override
  String get detailsFileName => 'Имя файла';

  @override
  String get detailsFolderName => 'Название папки';

  @override
  String get detailsParentFolder => 'Родительская папка';

  @override
  String get detailsFileSize => 'Размер файла';

  @override
  String get detailsFolderSize => 'Размер папки';

  @override
  String get detailsLastModified => 'Последнее изменение';

  @override
  String get detailsIsFavorite => 'Избранное';

  @override
  String get optionsFilesSortProperty => 'Как сортировать файлы';

  @override
  String get optionsFilesSortPropertyName => 'По имени';

  @override
  String get optionsFilesSortPropertyModifiedDate => 'По дате изменения';

  @override
  String get optionsFilesSortPropertySize => 'По размеру';

  @override
  String get optionsFilesSortOrder => 'Порядок сортировки файлов';

  @override
  String get optionsShowHiddenFiles => 'Показывать скрытые файлы';

  @override
  String get optionsUploadQueueParallelism => 'Параллелизм очереди загрузки';

  @override
  String get optionsDownloadQueueParallelism => 'Параллелизм очереди скачивания';

  @override
  String get optionsUploadSizeWarning => 'Предупреждение о размере загрузки';

  @override
  String get optionsDownloadSizeWarning => 'Предупреждение о размере скачивания';

  @override
  String get optionsSizeWarningDisabled => 'Отключено';
}
