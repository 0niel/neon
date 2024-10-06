import 'package:intl/intl.dart' as intl;

import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class DashboardLocalizationsRu extends DashboardLocalizations {
  DashboardLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get noEntries => 'Нет записей';

  @override
  String get setUserStatus => 'Установить статус';

  @override
  String weather(String code) {
    String _temp0 = intl.Intl.selectLogic(
      code,
      {
        'clearsky': 'ясное небо',
        'cloudy': 'облачно',
        'fair': 'хорошая погода',
        'partlycloudy': 'переменная облачность',
        'fog': 'туман',
        'rain': 'дождь',
        'lightrain': 'небольшой дождь',
        'heavyrain': 'сильный дождь',
        'rainshowers': 'дождевые дожди',
        'lightrainshowers': 'небольшие дожди',
        'heavyrainshowers': 'сильные дожди',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get locationSet => 'Установить местоположение для погоды';

  @override
  String get address => 'Адрес';

  @override
  String get openWidget => 'Открыть виджет';
}
