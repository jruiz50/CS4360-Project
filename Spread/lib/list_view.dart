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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey
          ),
          height: 50,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Icon(Icons.fastfood),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text ('Item name'),
                  const Text ('Item Rating'),
                  const Text ('Star Rating'),

                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(onPressed: null, icon: Icon(Icons.star_border))
                ],
              )
            ],
          ),

        );
      },

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    throw UnimplementedError();
  }

}

class launchListViewGuest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
