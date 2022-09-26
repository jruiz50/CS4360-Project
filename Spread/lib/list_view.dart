import 'package:flutter/material.dart';

class launchListView extends StatelessWidget {

  //final ListView myListView;
  //const launchView({super.key, required this.myListView})

  final List<String> entries = <String>["First placeholder",
    "Second placeholder", "Third placeholder"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      padding: const EdgeInsets.all(8) ,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.blue,
          child: Center(child: Text(entries[index]),),
        );
      },

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    throw UnimplementedError();
  }

}
