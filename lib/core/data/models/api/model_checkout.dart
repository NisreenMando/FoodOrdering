import 'package:easy_shopping/core/translations/app_translation.dart';

class Pay {
  String? iconpath;
  String? data;

  Pay({this.data, this.iconpath});

  static final check = [
    Pay(data: tr('casho')),
    Pay(iconpath: 'assets/payment/visa.png', data: '2187'),
    Pay(iconpath: 'assets/payment/visa.png', data: 'nisreen@gmail.com'),
  ];
}

class Account {
  String? type;
  String? money;

  Account({this.money, this.type});

  static final personal = [
    Account(type: tr('sub'), money: tr('68')),
    Account(type: tr('cost'), money: tr('2')),
    Account(type: tr('dis'), money: tr('4')),
    Account(type: tr('to'), money: tr('66')),
  ];
}
