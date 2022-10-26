class Menu {
  final int menuID;
  var foodItemIDs = <dynamic>[];
  final int restaurantID;
  final double rating;
  final int typeMenuID;

  Menu(
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

  static Menu fromJson(Map<String, dynamic> json) => Menu(
      menuID: json['menuID'],
      foodItemIDs: json['foodItemIDs'],
      restaurantID: json['restaurantID'],
      rating: json['rating'],
      typeMenuID: json['typeMenuID']);
}
