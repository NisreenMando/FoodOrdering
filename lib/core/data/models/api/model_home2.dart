import 'package:easy_shopping/core/translations/app_translation.dart';

class Recent {
  String? iconpath;
  String? stylefood;
  String? hotdrink;
  String? country;

  String? ratings;

  Recent(
      {this.hotdrink,
      this.iconpath,
      this.ratings,
      this.stylefood,
      this.country});

  static final items = [
    Recent(
        iconpath: 'https://picsum.photos/123',
        stylefood: tr('Four'),
        hotdrink: tr('cafe'),
        country: tr('western'),
        ratings: tr('ratings')),
    Recent(
        iconpath: 'https://picsum.photos/547',
        stylefood: tr('Margherita'),
        hotdrink: tr('cafe'),
        country: tr('western'),
        ratings: tr('ratings')),
    Recent(
        iconpath: 'https://picsum.photos/548',
        stylefood: tr('Chicken'),
        hotdrink: tr('cafe'),
        country: tr('western'),
        ratings: tr('ratings')),
    Recent(
        iconpath: 'https://picsum.photos/474',
        stylefood: tr('meat'),
        hotdrink: tr('cafe'),
        country: tr('western'),
        ratings: tr('ratings')),
    Recent(
        iconpath: 'https://picsum.photos/963',
        stylefood: tr('pepperoni_pizza'),
        hotdrink: tr('cafe'),
        country: tr('western'),
        ratings: tr('ratings')),
    Recent(
        iconpath: 'https://picsum.photos/584',
        stylefood: tr('Italian pizza'),
        hotdrink: tr('cafe'),
        country: tr('western'),
        ratings: tr('ratings')),
    Recent(
        iconpath: 'https://picsum.photos/314',
        stylefood: tr('Romana Pizza'),
        hotdrink: tr('cafe'),
        country: tr('western'),
        ratings: tr('ratings')),
  ];
}
