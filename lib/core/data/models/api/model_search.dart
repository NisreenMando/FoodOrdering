class Food {
  String? title;
  String? urlimage;

  Food({this.title,this.urlimage});

  static final allFood = 
  [
      Food(title: 'orang',urlimage: 'assets/more/offers.png'),
      Food(title: 'Milk',urlimage: 'assets/more/notice.png'),
      Food(title: 'coffee',urlimage: 'assets/more/info.png'),
      Food(title: 'Apple',urlimage: 'assets/more/offers.png'),
      Food(title: 'pizaa',urlimage: 'assets/more/notice.png'),
      Food(title: 'chicken',urlimage: 'assets/more/info.png'),
  ];
}
