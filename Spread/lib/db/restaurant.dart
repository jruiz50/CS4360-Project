class restaurant {
  final int restaurantID;
  final int regionID;
  final String restaurantName;
  final int menuID;
  final String coordinates;
  final Map tags;
  final double rating;

  const restaurant({
    required int restaurantID,
    required int regionID,
    required String restaurantName,
    required int menuID,
    required String coordinates,
    required Map tags,
    required double rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'restaurantID' : restaurantID,
      'regionID' : regionID,
      'restaurantName' : restaurantName,
      'menuID' : menuID,
      'coordinates' : coordinates,
      'tags' : tags,
      'rating' : rating,
    };
  }
}
