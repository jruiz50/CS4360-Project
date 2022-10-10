import 'package:flutter/material.dart';
import 'package:spread/userPage/userView.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {

  final AppBar appBar;
  const SearchAppBar({super.key, required this.appBar});

  //const SearchAppBar({Key key, this.appBar, this.widgets}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: double.infinity,
        height: 30,
        color: Colors.white,
        child: const Center(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'What are you craving?',
                hoverColor: Colors.greenAccent,//????
                prefixIcon: Icon(Icons.search)
            ),
          ),
        ),
      ),
      backgroundColor: Colors.greenAccent,
      actions: <Widget>[
        IconButton(onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => userView()));
        },
            icon: Icon(Icons.person))
      ],

    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}


