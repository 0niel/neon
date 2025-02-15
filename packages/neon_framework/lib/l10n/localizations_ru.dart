// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class NeonLocalizationsRu extends NeonLocalizations {
  NeonLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get nextcloud => 'Nextcloud';

  @override
  String get nextcloudLogo => 'Логотип Nextcloud';

  @override
  String appImplementationName(String app) {
    String _temp0 = intl.Intl.selectLogic(
      app,
      {
        'nextcloud': 'Nextcloud',
        'core': 'Сервер',
        'dashboard': 'Панель управления',
        'files': 'Файлы',
        'news': 'Новости',
        'notes': 'Заметки',
        'notifications': 'Уведомления',
        'spreed': 'Talk',
        'talk': 'Talk',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get loginAgain => 'Войти снова';

  @override
  String get loginOpenAgain => 'Открыть снова';

  @override
  String get loginSwitchToBrowserWindow => 'Пожалуйста, переключитесь на окно браузера, которое только что открылось, и продолжите там';

  @override
  String get loginWorksWith => 'работает с';

  @override
  String get loginUsingQRcode => 'Войти с помощью QR-кода';

  @override
  String get loginUsingServerAddress => 'Войти с использованием адреса сервера';

  @override
  String get loginServerVersion => 'Проверка версии сервера';

  @override
  String loginServerVersionSupported(String version) {
    return 'Поддерживаемая версия сервера: $version';
  }

  @override
  String loginServerVersionUnsupported(String version) {
    return 'Неподдерживаемая версия сервера: $version';
  }

  @override
  String get loginMaintenanceMode => 'Проверка режима обслуживания';

  @override
  String get loginMaintenanceModeEnabled => 'Режим обслуживания включён';

  @override
  String get loginMaintenanceModeDisabled => 'Режим обслуживания отключён';

  @override
  String get loginCheckingAccount => 'Проверка аккаунта';

  @override
  String get errorCredentialsForAccountNoLongerMatch => 'Данные для этого аккаунта больше не совпадают';

  @override
  String get errorBruteforceThrottled => 'Ваши запросы временно ограничены из-за защиты от перебора паролей';

  @override
  String get errorServerHadAProblemProcessingYourRequest => 'На сервере возникла проблема при обработке вашего запроса. Попробуйте ещё раз';

  @override
  String get errorSomethingWentWrongTryAgainLater => 'Что-то пошло не так. Попробуйте позже';

  @override
  String get errorUnableToReachServer => 'Не удалось установить соединение с сервером';

  @override
  String errorUnableToReachServerAt(String url) {
    return 'Не удалось установить соединение с сервером по адресу $url';
  }

  @override
  String get errorConnectionTimedOut => 'Время соединения истекло';

  @override
  String get errorNoCompatibleNextcloudAppsFound => 'Совместимые приложения Nextcloud не найдены.\nМы усердно работаем над тем, чтобы реализовать всё больше приложений!';

  @override
  String get errorServerInMaintenanceMode => 'Сервер находится в режиме обслуживания. Попробуйте позже или свяжитесь с администратором сервера.';

  @override
  String errorMissingPermission(String name) {
    return 'Отсутствует разрешение для $name';
  }

  @override
  String errorUnsupportedAppVersions(String names) {
    return 'К сожалению, версия следующих приложений на вашем экземпляре Nextcloud не поддерживается. \n $names \n Пожалуйста, свяжитесь с администратором для решения проблемы.';
  }

  @override
  String get errorEmptyField => 'Это поле не может быть пустым';

  @override
  String get errorInvalidURL => 'Указан неверный URL';

  @override
  String get errorInvalidQRcode => 'Указан неверный QR-код';

  @override
  String errorRouteNotFound(String route) {
    return 'Маршрут не найден: $route';
  }

  @override
  String get errorDialog => 'Произошла ошибка';

  @override
  String get actionYes => 'Да';

  @override
  String get actionNo => 'Нет';

  @override
  String get actionClose => 'Закрыть';

  @override
  String get actionRetry => 'Повторить';

  @override
  String get actionShowSlashHide => 'Показать/Скрыть';

  @override
  String get actionExit => 'Выход';

  @override
  String get actionContinue => 'Продолжить';

  @override
  String get actionCancel => 'Отмена';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionOpen => 'Открыть';

  @override
  String get firstLaunchGoToSettingsToEnablePushNotifications => 'Перейдите в настройки, чтобы включить push-уведомления';

  @override
  String get nextPushSupported => 'NextPush поддерживается!';

  @override
  String get nextPushSupportedText => 'NextPush – это FOSS-решение для получения push-уведомлений с использованием протокола UnifiedPush через сервер Nextcloud.\nВы можете установить NextPush из магазина F-Droid.';

  @override
  String get nextPushSupportedInstall => 'Установить NextPush';

  @override
  String searchIn(String app) {
    return 'Искать в $app';
  }

  @override
  String get searchNoResults => 'Ничего не найдено';

  @override
  String get searchGlobally => 'Искать по всему';

  @override
  String get settings => 'Настройки';

  @override
  String get settingsApps => 'Приложения';

  @override
  String get settingsAccount => 'Аккаунт';

  @override
  String get settingsExport => 'Экспорт настроек';

  @override
  String get settingsImport => 'Импорт настроек';

  @override
  String get settingsReset => 'Сбросить настройки?';

  @override
  String get settingsImportWrongFileExtension => 'Импорт настроек имеет неверное расширение файла (должно быть .json.base64)';

  @override
  String get settingsResetAll => 'Сбросить все настройки';

  @override
  String get settingsResetAllConfirmation => 'Вы действительно хотите сбросить все настройки?';

  @override
  String get settingsResetAllExplanation => 'Это приведёт к сбросу всех предпочтений к значениям по умолчанию.';

  @override
  String settingsResetFor(String name) {
    return 'Сбросить все настройки для $name';
  }

  @override
  String get settingsResetForExplanation => 'Это сбросит настройки вашего аккаунта к значениям по умолчанию.';

  @override
  String get settingsResetForClientExplanation => 'Это сбросит все настройки приложения к значениям по умолчанию.';

  @override
  String settingsResetForConfirmation(String name) {
    return 'Вы действительно хотите сбросить все настройки для $name?';
  }

  @override
  String get optionsCategoryGeneral => 'Общее';

  @override
  String get optionsCategoryTheme => 'Тема';

  @override
  String get optionsCategoryPushNotifications => 'Push-уведомления';

  @override
  String get optionsCategoryOther => 'Прочее';

  @override
  String get optionsCategoryAccounts => 'Аккаунты';

  @override
  String get optionsCategoryStartup => 'Запуск';

  @override
  String get optionsCategoryNavigation => 'Навигация';

  @override
  String get optionsSortOrderAscending => 'По возрастанию';

  @override
  String get optionsSortOrderDescending => 'По убыванию';

  @override
  String get globalOptionsThemeMode => 'Режим темы';

  @override
  String get globalOptionsThemeModeLight => 'Светлая';

  @override
  String get globalOptionsThemeModeDark => 'Тёмная';

  @override
  String get globalOptionsThemeModeAutomatic => 'Автоматически';

  @override
  String get globalOptionsThemeOLEDAsDark => 'Использовать OLED-тему как тёмную';

  @override
  String get globalOptionsThemeUseNextcloudTheme => 'Использовать тему Nextcloud';

  @override
  String get globalOptionsThemeCustomBackground => 'Пользовательский фон';

  @override
  String get globalOptionsPushNotifications => 'UnifiedPush';

  @override
  String get globalOptionsPushNotificationsDisabled => 'Отключено';

  @override
  String get globalOptionsPushNotificationsDistributorGotifyUP => 'Gotify-UP (FOSS)';

  @override
  String get globalOptionsPushNotificationsDistributorFirebaseEmbedded => 'Firebase (проприетарное)';

  @override
  String get globalOptionsPushNotificationsDistributorNtfy => 'ntfy (FOSS)';

  @override
  String get globalOptionsPushNotificationsDistributorFCMUP => 'FCM-UP (проприетарное)';

  @override
  String get globalOptionsPushNotificationsDistributorNextPush => 'NextPush (FOSS)';

  @override
  String get globalOptionsPushNotificationsDistributorNoProvider2Push => 'NoProvider2Push (FOSS)';

  @override
  String get globalOptionsPushNotificationsDistributorConversations => 'Conversations';

  @override
  String get globalOptionsStartupMinimized => 'Запускать свернутым';

  @override
  String get globalOptionsStartupMinimizeInsteadOfExit => 'Свернуть вместо выхода';

  @override
  String get globalOptionsAccountsRememberLastUsedAccount => 'Запомнить последний использованный аккаунт';

  @override
  String get globalOptionsAccountsInitialAccount => 'Начальный аккаунт';

  @override
  String get globalOptionsAccountsAdd => 'Добавить аккаунт';

  @override
  String get globalOptionsNavigationMode => 'Режим навигации';

  @override
  String get globalOptionsNavigationModeDrawer => 'Боковая панель';

  @override
  String get globalOptionsNavigationModeDrawerAlwaysVisible => 'Боковая панель всегда видна';

  @override
  String get accountOptionsDeleteOnServer => 'Удалить аккаунт на сервере';

  @override
  String get accountOptionsRemove => 'Удалить аккаунт';

  @override
  String accountOptionsRemoveConfirm(String id) {
    return 'Вы уверены, что хотите удалить аккаунт $id?';
  }

  @override
  String get accountOptionsRemoveLocal => 'Удалить аккаунт с устройства';

  @override
  String get accountOptionsRemoveRemote => 'Запрос на удаление аккаунта на сервере';

  @override
  String accountOptionsRemoveRemoteDelay(String time) {
    return 'Аккаунт будет удалён через $time';
  }

  @override
  String get accountOptionsCategoryStorageInfo => 'Информация о хранилище';

  @override
  String accountOptionsQuotaUsedOf(String used, String total, String relative) {
    return 'Использовано $used из $total ($relative%)';
  }

  @override
  String get accountOptionsInitialApp => 'Приложение для показа по умолчанию';

  @override
  String get accountOptionsAutomatic => 'Автоматически';

  @override
  String get licenses => 'Лицензии';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get issueTracker => 'Сообщить об ошибке или предложить функцию';

  @override
  String get relativeTimeNow => 'сейчас';

  @override
  String relativeTimePast(String time) {
    return '$time назад';
  }

  @override
  String relativeTimeFuture(String time) {
    return 'через $time';
  }

  @override
  String relativeTimeMinutes(int time, String abbreviation) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'минуты',
      one: 'минута',
    );
    String _temp1 = intl.Intl.selectLogic(
      abbreviation,
      {
        'true': 'м',
        'other': ' $_temp0',
      },
    );
    return '$time$_temp1';
  }

  @override
  String relativeTimeHours(int time, String abbreviation) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'часа',
      one: 'час',
    );
    String _temp1 = intl.Intl.selectLogic(
      abbreviation,
      {
        'true': 'ч',
        'other': ' $_temp0',
      },
    );
    return '$time$_temp1';
  }

  @override
  String relativeTimeDays(int time, String abbreviation) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'дня',
      one: 'день',
    );
    String _temp1 = intl.Intl.selectLogic(
      abbreviation,
      {
        'true': 'д',
        'other': ' $_temp0',
      },
    );
    return '$time$_temp1';
  }

  @override
  String relativeTimeYears(int time, String abbreviation) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'года',
      one: 'год',
    );
    String _temp1 = intl.Intl.selectLogic(
      abbreviation,
      {
        'true': 'г',
        'other': ' $_temp0',
      },
    );
    return '$time$_temp1';
  }

  @override
  String get userStatusSetStatus => 'Установить статус';

  @override
  String get userStatusOnline => 'Онлайн';

  @override
  String get userStatusAway => 'Отошёл';

  @override
  String get userStatusDoNotDisturb => 'Не беспокоить';

  @override
  String get userStatusDoNotDisturbDescription => 'Отключить все уведомления';

  @override
  String get userStatusInvisible => 'Невидимый';

  @override
  String get userStatusInvisibleDescription => 'Показываться как офлайн';

  @override
  String get userStatusClearAfter => 'Очистить статус через';

  @override
  String get userStatusClearAtDoNotClear => 'Не очищать';

  @override
  String get userStatusClearAtToday => 'Сегодня';

  @override
  String get userStatusClearAtThisWeek => 'На этой неделе';

  @override
  String get userStatusActionClear => 'Очистить статус';

  @override
  String get userStatusStatusMessage => 'Сообщение статуса';

  @override
  String get userStatusOnlineStatus => 'Статус онлайн';

  @override
  String get emojisCategorySmileysAndEmotions => 'Смайлики и эмоции';

  @override
  String get emojisCategoryPeople => 'Люди';

  @override
  String get emojisCategoryAnimalsAndNature => 'Животные и природа';

  @override
  String get emojisCategoryFoodAndDrink => 'Еда и напитки';

  @override
  String get emojisCategoryTravelAndPlaces => 'Путешествия и места';

  @override
  String get emojisCategoryActivitiesAndEvents => 'Активности и события';

  @override
  String get emojisCategoryObjects => 'Объекты';

  @override
  String get emojisCategorySymbols => 'Символы';

  @override
  String get emojisCategoryFlags => 'Флаги';
}
