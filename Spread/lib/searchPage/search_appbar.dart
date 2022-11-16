import 'package:flutter/material.dart';
import 'package:spread/userPage/userView.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:spread/dbObjects/foodItem.dart';
// import '../foodItemObject/foodItem.dart';
import 'list_view.dart';

// import '../foodItemObject/foodItem.dart';
// import 'list_view.dart';
import 'package:spread/searchPage/list_view.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const SearchAppBar({super.key, required this.appBar});

  //const SearchAppBar({Key key, this.appBar, this.widgets}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        width: double.infinity,
        height: 30,
        color: Colors.white,
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'What are you craving?',
              hoverColor: Colors.greenAccent, //????
              prefixIcon: IconButton(
                  onPressed: () async {
                    final result = await FirebaseFunctions.instance
                        .httpsCallable('getFoodItem')
                        .call();
                    foodEntries
                        .add(FoodItem.fromJson(result.data[0]['docData']));
                  },
                  icon: Icon(Icons.search)),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.greenAccent,
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => userView()));
            },
            icon: Icon(Icons.person))
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
