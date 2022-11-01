import 'package:flutter/material.dart';
import 'package:spread/itemPage/itemView.dart';
import 'package:cloud_functions/cloud_functions.dart';

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

class launchListTile extends StatefulWidget {
  const launchListTile({super.key});

  @override
  State<launchListTile> createState() => _launchListTile();
}

bool isFav = false; // TODO: isFav will need to be grabbed from db

class _launchListTile extends State<launchListTile>{

  final List<String> entries = <String>["First placeholder",
    "Second placeholder", "Third placeholder"];

  Icon unfav = Icon(Icons.star_border);
  Icon fav = Icon(Icons.star, color: Colors.yellow,);
  Icon? showIcon;
  int favIconNum = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TODO: will need to implement a way to do this for food items in db.
    // This is somehow connecting all 3 food items as one object, which is why
    // clicking on the fav button does the action for all three objects.
    // This is at least a start
      return ListView.builder(
        itemCount: entries.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, int index) {
          return Card(
            margin: EdgeInsets.all(1),
            elevation: 3,
            child:
              ListTile(
                leading: Icon(Icons.fastfood, size: 30,),
                title: Text('Food Name'),
                subtitle: Text('Item Star Rating'),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                        print(isFav);
                      });
                    },
                    icon: (isFav) ? fav : unfav),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => itemView()));
                },
              ),
          );
        },
      );

    // throw UnimplementedError();
  }
  
}

class launchGuestListTile extends StatelessWidget{

  final List<String> entries = <String>["First placeholder",
    "Second placeholder", "Third placeholder"];

  @override
  Widget build(BuildContext context) {

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
          ),
        );
      },
    );
    // throw UnimplementedError();
  }

}