import 'package:easy_shopping/core/translations/app_translation.dart';

class Notice {
  String? warning;
  String? hour;
  
  Notice({
    this.hour,
    this.warning,
   
  });

  static final not = [
    Notice(warning: tr('order'), hour: 'Now',),
    Notice(warning: tr('order'), hour: '1 h ago'),
    Notice(warning: tr('order'), hour: '3 h ago'),
    Notice(warning: tr('order'), hour: '5 h ago'),
    Notice(warning: tr('order'), hour: '05 sep 2020'),
    Notice(warning: tr('order'), hour: '12 Aug 2020'),
    Notice(warning: tr('order'), hour: '20 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
    Notice(warning: tr('order'), hour: '12 jul 2020'),
  ];
}
