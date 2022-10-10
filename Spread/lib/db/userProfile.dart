class userProfile {
  final int userID;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final Map favMenuIDs;
  final Map favFoodItemIDs;
  final Map allergens;
  final Map friendUserIDs;


  const userProfile({
    required int userID,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required Map favMenuIDs,
    required Map favFoodItemIDs,
    required Map allergens,
    required Map friendUserIDs,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID' : userID,
      'firstName' : firstName,
      'lastName' : lastName,
      'email' : email,
      'password' : password,
      'favMenuIDs' : favMenuIDs,
      'favFoodItemIDs' : favFoodItemIDs,
      'allergens' : allergens,
      'friendUserIDs' : friendUserIDs,
    };
  }
}
