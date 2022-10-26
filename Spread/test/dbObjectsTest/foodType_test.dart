import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/foodType.dart';

void main() {
  group('foodType Test', () {
    test('New Instance', () async {
      var file = File('test_resources/foodType.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      FoodType newFoodType = FoodType.fromJson(map);
      expect(newFoodType.foodTypeId, 1);
      expect(newFoodType.foodTypeAbbr, "Mex");
      expect(newFoodType.foodTypeDesc, "Mexican");
    });
  });
}
