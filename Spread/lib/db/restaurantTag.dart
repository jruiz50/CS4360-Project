class restaurantTag {
  final int restaurantTagID;
  final String restaurantTagName;
  final String restaurantTagDesc;
  final int count;

  const restaurantTag({
    required int restaurantTagID,
    required String restaurantTagName,
    required String restaurantTagDesc,
    required int count,
  });

  Map<String, dynamic> toMap() {
    return {
      'restaurantTagID' : restaurantTagID,
      'restaurantTagName' : restaurantTagName,
      'restaurantTagDesc' : restaurantTagDesc,
      'count' : count,
    };
  }
}
