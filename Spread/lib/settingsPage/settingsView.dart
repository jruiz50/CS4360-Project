import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/main.dart';

bool darkModeOn = false;

class settingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Text>[Text('Settings')],
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: settingsList(),
    );
    throw UnimplementedError();
  }
}

class settingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: ListTile(
            title: Text('Name: John Doe'),
            trailing: IconButton(
              onPressed: (null),
              icon: Icon(Icons.edit),
            ),
          ),
        ),
        Container(
          height: 50,
          child: ListTile(
            title: Text('Email: johndoe@gmail.com'),
            trailing: IconButton(
              onPressed: (null),
              icon: Icon(Icons.edit),
            ),
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
            trailing: SwitchState(),
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

class SwitchState extends StatefulWidget {
  const SwitchState({super.key});

  @override
  State<SwitchState> createState() => _SwitchState();
}

class _SwitchState extends State<SwitchState> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: darkModeOn,
      onChanged: (bool value) {
        setState(() {
          darkModeOn = value;
          runApp(MyApp());
        });
      },
    );
  }
}
