import 'package:easy_shopping/core/translations/app_translation.dart';

class Restaurent {
  String? iconpath;
  String? typefood;
  String? country;
  String? ranking;

  Restaurent({this.country, this.ranking, this.iconpath, this.typefood});

  static final food = [
    Restaurent(
        iconpath: 'https://picsum.photos/495',
        typefood: tr('coffee'),
        ranking: tr('rating'),
        country: tr('western')),
    Restaurent(
        iconpath: 'https://picsum.photos/496',
        typefood: tr('coffee'),
        ranking: tr('rating'),
        country: tr('western')),
    Restaurent(
        iconpath: 'https://picsum.photos/497',
        typefood: tr('coffee'),
        ranking: tr('rating'),
        country: tr('western')),
    Restaurent(
        iconpath: 'https://picsum.photos/498',
        typefood: tr('coffee'),
        ranking: tr('rating'),
        country: tr('western')),
    Restaurent(
        iconpath: 'https://picsum.photos/499',
        typefood: tr('coffee'),
        ranking: tr('rating'),
        country: tr('western')),
    Restaurent(
        iconpath: 'https://picsum.photos/500',
        typefood: tr('coffee'),
        ranking: tr('rating'),
        country: tr('western')),
  ];
}
