//Blueprint for all restaurant tags

class RestaurantTag {
  final int restaurantTagID;
  final String restaurantTagName;
  final String restaurantTagDesc;
  final int count;

  RestaurantTag(
      {required this.restaurantTagID,
      required this.restaurantTagName,
      required this.restaurantTagDesc,
      required this.count});

  Map<String, dynamic> toJson() => {
        'restaurantTagID': restaurantTagID,
        'restaurantTagName': restaurantTagName,
        'restaurantTagDesc': restaurantTagDesc,
        'count': count,
      };

  static RestaurantTag fromJson(Map<String, dynamic> json) => RestaurantTag(
      restaurantTagID: json['restaurantTagID'],
      restaurantTagName: json['restaurantTagName'],
      restaurantTagDesc: json['restaurantTagDesc'],
      count: json['count']);
}
