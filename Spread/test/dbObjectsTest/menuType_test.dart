import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/menuType.dart';

void main() {
  group('menuType Test', () {
    test('New Instance', () async {
      var file = File('test_resources/menuType.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      MenuType newMenuType = MenuType.fromJson(map);
      expect(newMenuType.typeMenuID, 1);
      expect(newMenuType.typeName, "Bar");
    });
  });
}
