class restaurant {
  final int restaurantID;
  final int regionID;
  final String restaurantName;
  final int menuID;
  final String coordinates;
  var tags = <String>[];
  final double rating;
  var foodTypeIDs = <int>[];

  restaurant(
      {required this.restaurantID,
      required this.regionID,
      required this.restaurantName,
      required this.menuID,
      required this.coordinates,
      required this.tags,
      required this.rating,
      required this.foodTypeIDs});

  Map<String, dynamic> toJson() => {
        'restaurantID': restaurantID,
        'regionID': regionID,
        'restaurantName': restaurantName,
        'menuID': menuID,
        'coordinates': coordinates,
        'tags': tags,
        'rating': rating,
        'foodTypeIDs': foodTypeIDs
      };

  static restaurant fromJson(Map<String, dynamic> json) => restaurant(
      restaurantID: json['restaurantID'],
      regionID: json['regionID'],
      restaurantName: json['restaurantName'],
      menuID: json['menuID'],
      coordinates: json['coordinates'],
      tags: json['tags'],
      rating: json['rating'],
      foodTypeIDs: json['foodTypeIDs']);
}
