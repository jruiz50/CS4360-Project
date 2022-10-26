import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:spread/dbObjects/userProfile.dart';

void main() {
  group('User Profile tests', () {
    test("New Instance", () async {
      var file = File('test_resources/userProfile.json');
      Map<String, dynamic> map = jsonDecode(await file.readAsString());
      UserProfile newUserProfile = UserProfile.fromJson(map);
      expect(newUserProfile.userID, 1);
      expect(newUserProfile.firstName, "John");
      expect(newUserProfile.lastName, "Doe");
      expect(newUserProfile.email, "johndoe@email.com");
      expect(newUserProfile.password, "********");
      expect(newUserProfile.favFoodItemIDs, [1, 2, 3]);
      expect(newUserProfile.favMenuIDs, [1, 2, 3]);
      expect(newUserProfile.allergens, ["Peanut"]);
      expect(newUserProfile.friendUserIDs, [1, 2, 3]);
    });
  });
}
