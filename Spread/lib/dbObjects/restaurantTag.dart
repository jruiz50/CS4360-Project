class restaurantTag {
  final int restaurantTagID;
  final String restaurantTagName;
  final String restaurantTagDesc;
  final int count;

  restaurantTag(
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

  static restaurantTag fromJson(Map<String, dynamic> json) => restaurantTag(
      restaurantTagID: json['restaurantTagID'],
      restaurantTagName: json['restaurantTagName'],
      restaurantTagDesc: json['restaurantTagDesc'],
      count: json['count']);
}
