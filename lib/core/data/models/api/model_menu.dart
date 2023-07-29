import 'package:easy_shopping/core/translations/app_translation.dart';

class MenuFood {
  int id;
  String? iconpath;
  String? typefood;
  String? itemsfood;

  MenuFood({this.iconpath, this.itemsfood, this.typefood, required this.id});

  static final foods = [
    MenuFood(
        id: 0,
        iconpath: 'https://picsum.photos/495',
        typefood: tr('food'),
        itemsfood: tr('120_items')),
    MenuFood(
        id: 1,
        iconpath: 'https://picsum.photos/496',
        typefood: tr('beverages'),
        itemsfood: tr('220_items')),
    MenuFood(
        id: 2,
        iconpath: 'https://picsum.photos/497',
        typefood: tr('desserts'),
        itemsfood: tr('150_items')),
    MenuFood(
        id: 3,
        iconpath: 'https://picsum.photos/498',
        typefood: tr('promotions'),
        itemsfood: tr('25_items')),
  ];
}
