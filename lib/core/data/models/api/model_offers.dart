import 'package:easy_shopping/core/translations/app_translation.dart';

class OffersFood {
  String? iconpath;
  String? stylefood;
  String? city;
  String? ratings;
  String? iconpathst;
  String? value;

  OffersFood(
      {this.city,
      this.iconpath,
      this.ratings,
      this.stylefood,
      this.iconpathst,
      this.value});

  static final kind = [
    OffersFood(
        iconpath: 'https://picsum.photos/555',
        stylefood: tr('cafe_familia'),
        value: '4.9',
        iconpathst: 'assets/food/star.png',
        ratings: tr('ratings'),
        city: tr('western')),
    OffersFood(
      iconpath: 'https://picsum.photos/547',
      stylefood: tr('cafe_familia'),
      value: '4.9',
      iconpathst: 'assets/food/star.png',
      ratings: tr('ratings'),
      city: tr('western'),
    ),
    OffersFood(
      iconpath: 'https://picsum.photos/548',
      stylefood: tr('cafe_familia'),
      value: '4.9',
      iconpathst: 'assets/food/star.png',
      ratings: tr('ratings'),
      city: tr('western'),
    ),
  ];
}
