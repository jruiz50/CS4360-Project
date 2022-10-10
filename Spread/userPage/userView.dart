import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/main.dart';

class userView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: profileAppBar(
        appBar: AppBar(),
      ),

      body: Center(
        child: Text(
            'Placeholder body'
        ),
      ),
    );
}
}

class profileAppBar extends StatelessWidget implements PreferredSizeWidget {

  final AppBar appBar;
  const profileAppBar({super.key, required this.appBar});

  //const SearchAppBar({Key key, this.appBar, this.widgets}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: double.infinity,
        height: 30,
        child: const Center(
          child: Text(
            'Name Placeholder'
          ),
        ),
      ),
      backgroundColor: Colors.greenAccent,

    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}