import 'package:easy_shopping/core/translations/app_translation.dart';

class More {
  String? iconpath;
  String? data;
  int? id;
  String? number;

  More({this.data, this.iconpath, this.id, this.number});

  static final moredata = [
    More(id: 0, iconpath: 'assets/more/hand.png', data: tr('payment')),
    More(id: 1, iconpath: 'assets/more/offers.png', data: tr('my')),
    More(
        id: 2,
        iconpath: 'assets/more/notice.png',
        data: tr('notef'),
        number: '15'),
    More(id: 3, iconpath: 'assets/more/message.png', data: tr('inbox')),
    More(id: 4, iconpath: 'assets/more/info.png', data: tr('about')),
  ];
}
