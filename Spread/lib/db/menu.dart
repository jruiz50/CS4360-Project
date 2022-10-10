class menu {
  final int menuID;
  final Map foodItemIDs;
  final int restaurantID;
  final double rating;
  final int typeMenuID;

  const menu({
    required int menuID,
    required Map foodItemIDs,
    required int restaurantID,
    required double rating,
    required int typeMenuID,
  });

  Map<String, dynamic> toMap() {
    return {
      'menuID' : menuID,
      'foodItemIDs' : foodItemIDs,
      'restaurantID' : restaurantID,
      'rating' : rating,
      'typeMenuID' : typeMenuID,
    };
  }
}
