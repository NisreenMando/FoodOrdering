import 'package:easy_shopping/core/translations/app_translation.dart';

class Require {
  String? food;
  String? ratings;

  Require({this.food, this.ratings});

  static final orders = [
    Require(food: tr('beef'), ratings: '16'),
    Require(food: tr('classic'), ratings: '14'),
    Require(food: tr('cheese'), ratings: '17'),
    Require(food: tr('chicken'), ratings: '15'),
    Require(food: tr('french'), ratings: '6'),
  ];
}
