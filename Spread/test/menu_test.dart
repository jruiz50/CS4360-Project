import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/menu.dart';

void main() {
  var newMenu = menu(
      menuID: 1,
      foodItemIDs: [1, 2],
      rating: 4.5,
      restaurantID: 1,
      typeMenuID: 1);
  test("Menu test", () {
    expect(newMenu.foodItemIDs, equals([1, 2]));
    expect(newMenu.menuID, 1);
    expect(newMenu.rating, 4.5);
    expect(newMenu.restaurantID, 1);
    expect(newMenu.typeMenuID, 1);
  });
}
