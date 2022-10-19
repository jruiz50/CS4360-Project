import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class settingsView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Row(
        children: <Text>[
          Text('Settings')
        ],
      ),
        backgroundColor: Colors.greenAccent,
      ),
      body: settingsList(),
    );
    throw UnimplementedError();
  }

}

class settingsList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: ListTile(
            title: Text('Name: John Doe'),
            trailing: IconButton(onPressed: (null), icon: Icon(Icons.edit),),
          ),
        ),
       Container(
         height: 50,
         child: ListTile(
           title: Text('Email: johndoe@gmail.com'),
           trailing: IconButton(onPressed: (null), icon: Icon(Icons.edit),),
         ),
       ),
        Container(
          height: 50,
          child: ListTile(
            title: Text('User ID: 9876987698760'),
          ),
        ),
        Container(
          height: 50,
          child: ListTile(
            title: Text('Dark Mode'),
            trailing: Text('Put Switch Class here'),
          ),
        )
      ],

    );
    /* Will be functionally a bit different. Maybe include 'onLongPress'
    * to delete entries that are already present in your favorites?
    *  */
    throw UnimplementedError();
  }

}