import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/restaurant.dart';

void main() {
  group('Restaurant tests', () {
    test("New Instance", () async {
      var file = File('test_resources/restaurant.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      Restaurant newRestaurant = Restaurant.fromJson(map);
      expect(newRestaurant.restaurantID, 1);
      expect(newRestaurant.regionID, 2);
      expect(newRestaurant.menuID, 3);
      expect(newRestaurant.restaurantName, "Chili's");
      expect(newRestaurant.coordinates, "39.65141, 105.05664");
      expect(newRestaurant.tags, ["Spicy", "Yum"]);
      expect(newRestaurant.rating, 4.5);
      expect(newRestaurant.foodTypeIDs, [1, 2, 3]);
    });
  });
}
