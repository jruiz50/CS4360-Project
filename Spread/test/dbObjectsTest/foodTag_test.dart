import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/foodTag.dart';

void main() {
  group('foodTag Test', () {
    test('New Instance', () async {
      var file = File('test_resources/foodTag.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      FoodTag newFoodTag = FoodTag.fromJson(map);
      expect(newFoodTag.foodTagId, 1);
      expect(newFoodTag.foodTagName, "Yum");
      expect(newFoodTag.foodTagDesc, "Yummy");
      expect(newFoodTag.foodTagCount, 5);
    });
  });
}
