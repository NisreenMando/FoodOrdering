class CategoryModel {
  int? id;
  String? name;
  String? logo;
  List<Meals>? meals;

  CategoryModel({this.id, this.name, this.logo, this.meals});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? name;
  int? mealId;
  int? categoryId;
  int? price;
  List<String>? images;

  Meals({this.name, this.mealId, this.categoryId, this.price, this.images});

  Meals.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mealId = json['mealId'];
    categoryId = json['categoryId'];
    price = json['price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['mealId'] = this.mealId;
    data['categoryId'] = this.categoryId;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}
