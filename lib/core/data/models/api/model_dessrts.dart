import 'package:easy_shopping/core/translations/app_translation.dart';

class DessertsType {
  String? iconPath;
  String? typeFood;
  String? itemsFood;
  String? type;

  DessertsType({this.iconPath, this.itemsFood, this.type, this.typeFood});

  static final types = [
    DessertsType(
        iconPath: 'https://picsum.photos/258',
        typeFood: tr('french_apple_pie'),
        itemsFood: tr('cafe_racer'),
        type: tr('desserts')),
    DessertsType(
        iconPath: 'https://picsum.photos/259',
        typeFood: tr('dark_chocolate_cake'),
        itemsFood: tr('cafe_racer'),
        type: tr('desserts')),
    DessertsType(
        iconPath: 'https://picsum.photos/300',
        typeFood: tr('street_shake'),
        itemsFood: tr('cafe_racer'),
        type: tr('desserts')),
    DessertsType(
        iconPath: 'https://picsum.photos/400',
        typeFood: tr('GALAXY'),
        itemsFood: tr('cafe_racer'),
        type: tr('desserts')),
  ];
}
