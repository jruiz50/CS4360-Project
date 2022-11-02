import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Text>[Text('Menus')],
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: menuList(),
    );
    throw UnimplementedError();
  }
}

class menuList extends StatelessWidget {
  final List<String> entries = <String>[
    "First placeholder",
    "Second placeholder"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.builder(
        itemCount: entries.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, int index) {
          return Card(
            margin: EdgeInsets.all(1),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                Icons.fastfood,
                size: 30,
              ),
              title: Text(entries[index]),
              subtitle: Text('Description'),
              onTap: () {},
              onLongPress: (null),
            ),
          );
        });
    /* Will be functionally a bit different. Maybe include 'onLongPress'
    * to delete entries that are already present in your favorites?
    *  */
    throw UnimplementedError();
  }
}
