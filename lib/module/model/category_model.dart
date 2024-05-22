class Category {
  String? title;
  String? icon;
  String? activeIcon;
  Category({this.title, this.icon, this.activeIcon});

  Category.fromMap(Map<String, String> map) {
    title = map['title'];
    icon = map['icon'];
    activeIcon = map['active'];
  }

  Map<String, String> toMap() {
    Map<String, String> data = <String, String>{};
    data['title'] = title!;
    data['icon'] = icon!;
    data['active'] = icon!;
    return data;
  }
}

class CategoryModel {
  String? title;
  String? image;
  double? price;
  CategoryModel({this.title, this.image, this.price});

  CategoryModel.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    image = map['image'];
    price = map['price'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title!;
    data['image'] = image!;
    data['price'] = price!;
    return data;
  }
}
