class menu {
  final int menuID;
  var foodItemIDs = <int>[];
  final int restaurantID;
  final double rating;
  final int typeMenuID;

  menu(
      {required this.menuID,
      required this.foodItemIDs,
      required this.restaurantID,
      required this.rating,
      required this.typeMenuID});

  Map<String, dynamic> toJson() => {
        'menuID': menuID,
        'foodItemIDs': foodItemIDs,
        'restaurantID': restaurantID,
        'rating': rating,
        'typeMenuID': typeMenuID,
      };

  static menu fromJson(Map<String, dynamic> json) => menu(
      menuID: json['menuID'],
      foodItemIDs: json['foodItemIDs'],
      restaurantID: json['restaurantID'],
      rating: json['rating'],
      typeMenuID: json['typeMenuID']);
}
