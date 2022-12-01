// Blueprint for all food items
// Each object has a item name, category, rating, ingredients, allergens, restaurant name, restaurantId, image URL, and tags.

class FoodItem {
  final String? foodItemID;
  final String? itemName;
  final String? categoryOfFood;
  final int? rating;
  final List? ingredients;
  final List? allergens;
  final String? restaurantName;
  final String? restaurantID;
  final String? imageURL;
  final List? tags;
  final String? desc;

  FoodItem(
      {this.desc,
      this.foodItemID = '1',
      this.itemName = 'test',
      this.categoryOfFood = 'N/A',
      this.rating = 0,
      this.ingredients,
      this.allergens,
      this.restaurantName = 'test',
      this.restaurantID = 'test',
      this.imageURL = '',
      this.tags});

  Map<String, dynamic> toJson() => {
        'foodItemID': foodItemID,
        'itemName': itemName,
        'categoryOfFood': categoryOfFood,
        'rating': rating,
        'ingredients': ingredients,
        'allergens': allergens,
        'restaurantName': restaurantName,
        'restaurantID': restaurantID,
        'imageURL': imageURL,
        'tags': tags
      };

  static FoodItem fromJson(json) => FoodItem(
      foodItemID: json['foodItemID'],
      itemName: json['itemName'],
      categoryOfFood: json['categoryOfFood'],
      rating: json['rating'],
      ingredients: json['ingredients'],
      allergens: json['allergens'],
      restaurantName: json['restaurantName'],
      restaurantID: json['restaurantID'],
      imageURL: json['imageURL'],
      tags: json['tags']);
}
