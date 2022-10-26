//Blueprint for all user profiles

class UserProfile {
  final int userID;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  var favMenuIDs = <dynamic>[];
  var favFoodItemIDs = <dynamic>[];
  var allergens = <dynamic>[];
  var friendUserIDs = <dynamic>[];

  UserProfile(
      {required this.userID,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.favMenuIDs,
      required this.favFoodItemIDs,
      required this.allergens,
      required this.friendUserIDs});

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'favMenuIDs': favMenuIDs,
        'favFoodItemIDs': favFoodItemIDs,
        'allergens': allergens,
        'friendUserIDs': friendUserIDs
      };

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
      userID: json['userID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      favMenuIDs: json['favMenuIDs'],
      favFoodItemIDs: json['favFoodItemIDs'],
      allergens: json['allergens'],
      friendUserIDs: json['friendUserIDs']);
}
