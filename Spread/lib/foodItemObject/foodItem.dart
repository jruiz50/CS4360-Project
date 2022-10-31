// Blueprint for all food items
// Each object has a item name, category, rating, ingredients, allergens, restaurant name, restaurantId, image URL, and tags.

class FoodItem {
  final String itemName;
  final String categoryOfFood;
  final int rating;
  var ingredients = <String>[];
  var allergens = <String>[];
  final String restaurantName;
  final String restaurantId;
  final String imageURL;
  var tags = <String>[];

  FoodItem(
      {required this.itemName,
      required this.categoryOfFood,
      required this.rating,
      required this.ingredients,
      required this.allergens,
      required this.restaurantName,
      required this.restaurantId,
      required this.imageURL,
      required this.tags});

  Map<String, dynamic> toJson() => {
        'itemName': itemName,
        'categoryOfFood': categoryOfFood,
        'rating': rating,
        'ingredients': ingredients,
        'allergens': allergens,
        'restaurantName': restaurantName,
        'restaurantId': restaurantId,
        'imageURL': imageURL,
        'tags': tags
      };

  static FoodItem fromJson(Map<String, dynamic> json) => FoodItem(
      itemName: json['itemName'],
      categoryOfFood: json['categoryOfFood'],
      rating: json['rating'],
      ingredients: json['ingredients'],
      allergens: json['allergens'],
      restaurantName: json['restaurantName'],
      restaurantId: json['restaurantId'],
      imageURL: json['imageURL'],
      tags: json['tags']);
}
