import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/favPage/favView.dart';
import 'package:spread/loginPage/loginView.dart';
import '../friendPage/friendView.dart';
import '../menuPage/menuView.dart';
import '../settingsPage/settingsView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class userView extends StatefulWidget {
  const userView({super.key});

  @override
  State<userView> createState() => _userViewState();
}

class _userViewState extends State<userView> {
  var _fName = "";
  var _lName = "";
  var _userID = "";

  Future<Map<dynamic, dynamic>> getUserProfile(String userID) async {
    try {
      final userProfile = await FirebaseFunctions.instance
          .httpsCallable('getUserProfile')
          .call({"userID": userID});
      return userProfile.data;
    } catch (e) {
      print(e);
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_fName == "") {
      getUserProfile(FirebaseAuth.instance.currentUser?.uid ?? "")
          .then((userProfile) {
        print(userProfile);
        setState(() {
          _fName = userProfile["firstName"];
          _lName = userProfile["lastName"];
          _userID = userProfile["userID"];
        });
      });
    }

    return Scaffold(
        appBar: ProfileAppBar(
          appBar: AppBar(),
        ),
        body: ListView(
          children: <Widget>[
            Icon(
              Icons.person,
              size: 300,
            ), //Placeholder
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Text>[Text(_fName + " " + _lName), Text("")],
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.menu_book),
                title: Text("Saved Menus"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => menuView()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Favorites'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => favView()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.people_alt),
                title: Text("Friends"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => friendView()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => settingsView()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person_off),
                title: Text("Log Out"),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginView()));
                },
              ),
            )
          ],
        ));
  }
}

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const ProfileAppBar({super.key, required this.appBar});

  //const SearchAppBar({Key key, this.appBar, this.widgets}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Text>[Text('Profile')],
      ),
      backgroundColor: Colors.greenAccent,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
