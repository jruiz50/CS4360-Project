import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/ingredients.dart';

void main() {
  group('Ingredients tests', () {
    test("New Instance", () async {
      var file = File('test_resources/ingredient.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      Ingredients newIngredients = Ingredients.fromJson(map);
      expect(newIngredients.ingredientID, 1);
      expect(newIngredients.ingredientName, "Peanuts");
      expect(newIngredients.isAllergen, true);
    });
  });
}
