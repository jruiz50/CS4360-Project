import 'package:flutter/material.dart';

class launchListView extends StatelessWidget {
  //final ListView myListView;
  //const launchView({super.key, required this.myListView})

  final List<String> entries = <String>[
    "First placeholder",
    "Second placeholder",
    "Third placeholder"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Icon(Icons.fastfood),
                ],
              ),
              Column(
                children: const <Widget>[
                  Text('Item name'),
                  Text('Item Rating'),
                  Text('Star Rating'),
                ],
              ),
              Column(
                children: const <Widget>[
                  IconButton(onPressed: null, icon: Icon(Icons.star_border))
                ],
              )
            ],
          ),
        );
      }, // Use a listtile next time, ya goof!!

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class launchListViewGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      "First placeholder",
      "Second placeholder",
      "Third placeholder"
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Icon(Icons.fastfood),
                ],
              ),
              Column(
                children: const <Widget>[
                  Text('Item name'),
                  Text('Item Rating'),
                  Text('Star Rating'),
                ],
              ),
            ],
          ),
        );
      }, // Use a listtile next time, ya goof!!

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
