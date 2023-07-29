import 'package:easy_shopping/core/translations/app_translation.dart';

class ReadyMeal {
  String? iconpath;
  String? type;

  ReadyMeal({this.iconpath, this.type});

  static final fastFood = [
    ReadyMeal(iconpath: 'https://picsum.photos/495', type: 'offers'),
    ReadyMeal(iconpath: 'https://picsum.photos/496', type: tr('italian')),
    ReadyMeal(iconpath: 'https://picsum.photos/482', type: tr('meet')),
    ReadyMeal(iconpath: 'https://picsum.photos/400', type: tr('offers')),
    ReadyMeal(iconpath: 'https://picsum.photos/484', type: tr('italian')),
    ReadyMeal(iconpath: 'https://picsum.photos/485', type: tr('meet')),
    ReadyMeal(iconpath: 'https://picsum.photos/486', type: tr('offers')),
    ReadyMeal(iconpath: 'https://picsum.photos/487', type: tr('italian')),
  ];
}
