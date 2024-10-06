import 'package:intl/intl.dart' as intl;

import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class TalkLocalizationsRu extends TalkLocalizations {
  TalkLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get actorSelf => 'Вы';

  @override
  String get actorGuest => 'Гость';

  @override
  String get roomCreate => 'Создать комнату';

  @override
  String get roomCreateUserName => 'Имя пользователя';

  @override
  String get roomCreateGroupName => 'Имя группы';

  @override
  String get roomCreateRoomName => 'Имя комнаты';

  @override
  String roomType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'oneToOne': 'Личная',
        'group': 'Группа',
        'public': 'Общедоступная',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get roomWriteMessage => 'Напишите сообщение...';

  @override
  String get roomMessageAddEmoji => 'Добавить эмодзи к сообщению';

  @override
  String get roomMessageSend => 'Отправить сообщение';

  @override
  String get roomMessageReply => 'Ответить';

  @override
  String get roomMessageReaction => 'Добавить реакцию';

  @override
  String get roomMessageDelete => 'Удалить';

  @override
  String get roomMessageEdit => 'Редактировать';

  @override
  String get roomMessageEdited => 'отредактировано';

  @override
  String roomMessageLastEdited(String name, String time) {
    return 'Последнее редактирование $name в $time';
  }

  @override
  String get reactionsAddNew => 'Добавить новую реакцию';

  @override
  String get reactionsLoading => 'Загрузка реакций';

  @override
  String get roomsCreateNew => 'Создать новую комнату';
}
