import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/regionType.dart';

void main() {
  group('Region Type tests', () {
    test("New Instance", () async {
      var file = File('test_resources/regionType.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      RegionType newRegionType = RegionType.fromJson(map);
      expect(newRegionType.regionID, 1);
      expect(newRegionType.regionAbbr, "USA");
      expect(newRegionType.regionDesc, "United States");
    });
  });
}
