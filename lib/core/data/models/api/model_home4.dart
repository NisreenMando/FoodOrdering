import 'package:easy_shopping/core/translations/app_translation.dart';

class FoodPapular {
  String? iconpath;
  String? typefo;
  String? drink;
  String? city;

  FoodPapular({this.city, this.drink, this.iconpath, this.typefo});

  static final delivery = [
    FoodPapular(
        iconpath: 'https://picsum.photos/498',
        typefo: tr('Clubcoffee'),
        drink: tr('cafe'),
        city: tr('western')),
    FoodPapular(
        iconpath: 'https://picsum.photos/551',
        typefo: tr('Clubcoffee'),
        drink: tr('cafe'),
        city: tr('western')),
    FoodPapular(
        iconpath: 'https://picsum.photos/557',
        typefo: tr('Clubcoffee'),
        drink: tr('cafe'),
        city: tr('western')),
    FoodPapular(
        iconpath: 'https://picsum.photos/789',
        typefo: tr('Clubcoffee'),
        drink: tr('cafe'),
        city: tr('western')),
    FoodPapular(
        iconpath: 'https://picsum.photos/457',
        typefo: tr('Clubcoffee'),
        drink: tr('cafe'),
        city: tr('western')),
    FoodPapular(
        iconpath: 'https://picsum.photos/154',
        typefo: tr('Clubcoffee'),
        drink: tr('cafe'),
        city: tr('western')),
    FoodPapular(
        iconpath: 'https://picsum.photos/354',
        typefo: tr('Clubcoffee'),
        drink: tr('cafe'),
        city: tr('western')),
  ];
}
