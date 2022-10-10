import 'package:flutter/material.dart';

import '../itemPage/itemView.dart';

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
      }, // Use a listtile next time, ya goof!!

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    throw UnimplementedError();
  }

}

class launchListViewGuest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final List<String> entries = <String>["First placeholder",
      "Second placeholder", "Third placeholder"];

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
            ],
          ),

        );
      }, // Use a listtile next time, ya goof!!

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
    throw UnimplementedError();
  }

}

class launchListTile extends StatelessWidget{

  final List<String> entries = <String>["First placeholder",
    "Second placeholder", "Third placeholder"];

  Icon unfav = Icon(Icons.star_border);
  Icon fav = Icon(Icons.star, color: Colors.yellow,);
  Icon? showIcon;
  int favIconNum = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Icon showIcon = unfav;

    return ListView.builder(
      itemCount: entries.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, int index){
        return Card(
          margin: EdgeInsets.all(1),
          elevation: 3,
          child: ListTile(
            leading: Icon(Icons.fastfood, size: 30,),
            title: Text('Food Name'),
            subtitle: Text('Item Star Rating'),
            trailing: IconButton(onPressed: (favorite), icon: showIcon),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => itemView()));
            },
          ),

        );
      },

    );

    throw UnimplementedError();
  }

  void favorite(){

    if(favIconNum == 0){
      showIcon = unfav;
      favIconNum = 1;
      print('Bro');

    }

    else{
      showIcon = fav;
      favIconNum = 0;
      print('Bruh');
    }


  }
  
}
