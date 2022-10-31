import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class friendView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Text>[Text('Friend List')],
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: friendList(),
    );
    throw UnimplementedError();
  }
}

class friendList extends StatelessWidget {
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
              title: Text(entries[index]),
              subtitle: Text('Friend ID/User ID'),
              trailing: IconButton(
                  onPressed: (null),
                  icon: Icon(
                    Icons.send,
                    color: Colors.lightBlueAccent,
                  )),
              onLongPress: (null),
              // LongPress could be a delete function
            ),
          );
        });
    /* Will be functionally a bit different. Maybe include 'onLongPress'
    * to delete entries that are already present in your favorites?
    *  */
    throw UnimplementedError();
  }
}
