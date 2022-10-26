import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/restaurantTag.dart';

void main() {
  group('Restaurant Tags tests', () {
    test("New Instance", () async {
      var file = File('test_resources/restaurantTag.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      RestaurantTag newRestaurantTag = RestaurantTag.fromJson(map);
      expect(newRestaurantTag.restaurantTagID, 1);
      expect(newRestaurantTag.restaurantTagName, "Yum");
      expect(newRestaurantTag.restaurantTagDesc, "Yummy");
    });
  });
}
