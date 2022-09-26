import 'package:flutter/material.dart';

class launchListView extends StatelessWidget {

  //final ListView myListView;
  //const launchView({super.key, required this.myListView})

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: const EdgeInsets.all(8) ,
      children: <Widget>[
        Container(
          height: 30,
          color: Colors.blue,
          child: const Center(child: Text('Test 1')),
        ),
        Container(
          height: 30,
          color: Colors.blue,
          child: const Center(child: Text('Test 2')),
        ),
        Container(
          height: 30,
          color: Colors.blue,
          child: const Center(child: Text('Test 3')),
        )

      ],

    );

    throw UnimplementedError();
  }

}
