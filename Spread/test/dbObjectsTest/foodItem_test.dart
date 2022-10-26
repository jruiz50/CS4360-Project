import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/foodItem.dart';

void main() {
  group('foodItem tests', () {
    test("New Instance", () async {
      var file = File('test_resources/foodItem.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      FoodItem newFoodItem = FoodItem.fromJson(map);
      expect(newFoodItem.itemName, "Pizza");
      expect(newFoodItem.categoryOfFood, "Italian");
      expect(newFoodItem.rating, 3.5);
      expect(newFoodItem.ingredients, ["Cheese", "Flour", "Pepperoni"]);
      expect(newFoodItem.allergens, ["Gluten"]);
      expect(newFoodItem.restaurantName, "Dominos");
      expect(newFoodItem.restaurantId, 1);
      expect(newFoodItem.imageURL,
          "https://www.cuisinart.com/globalassets/catalog/appliances/food-processors/complete-chef-cooking-food-processor/pepperonipizza_ss656275903.jpg");
      expect(newFoodItem.tags, ["cheesy", "yummy"]);
    });
  });
}
