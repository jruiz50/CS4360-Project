import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/menu.dart';

void main() {
  group('Menu tests', () {
    test("New Instance", () async {
      var file = File('test_resources/menu.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      Menu newMenu = Menu.fromJson(map);
      expect(newMenu.foodItemIDs, equals([1, 2]));
      expect(newMenu.menuID, 1);
      expect(newMenu.rating, 4.5);
      expect(newMenu.restaurantID, 1);
      expect(newMenu.typeMenuID, 1);
    });

    // test("Covert Instance into map", () {
    //   Menu newMenu = Menu(
    //       menuID: 1,
    //       foodItemIDs: [1, 2],
    //       rating: 4.5,
    //       typeMenuID: 1,
    //       restaurantID: 1);

    //   String json = jsonEncode(newMenu.toJson());
    //   String jsonExcpected = "{
    //     "menuID": 1,
    //     "foodItemIDs": [1, 2],
    //     "rating": 4.5,
    //     "restaurantID": 1,
    //     "typeMenuID": 1
    //   }";
    //   expect(json, jsonExcpected);
    // });
  });
}
