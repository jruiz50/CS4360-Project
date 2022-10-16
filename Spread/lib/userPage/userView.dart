import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/favPage/favView.dart';
import 'package:spread/main.dart';

class userView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: ProfileAppBar(
        appBar: AppBar(),
      ),

      body: Column(
        children: <Widget>[
          Icon(Icons.person, size: 400,),//Placeholder
          Card(child:
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text("Saved Menus"),
            onTap: null,
          ),),
          Card(child:
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Favorites'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => favView()));
            },
          ),),
          Card(child:
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("Friends"),
            onTap: null,
          ),),
          Card(child:
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: null,
            ),)
        ],
      )
    );
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
        children: <Text>[
          Text('Profile')
        ],
      ),
      backgroundColor: Colors.greenAccent,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}