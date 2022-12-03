import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/itemPage/itemView.dart';
import 'package:spread/searchPage/list_view.dart';

class menuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Text>[Text('Uploaded Items')],
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

  setImage(url) {
    if (url != null) {
      return SizedBox(
        height: 50,
        width: 50,
        child: Image.network(url, errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.fastfood,
            size: 30,
          );
        }),
      );
    } else {
      return const Icon(
        Icons.fastfood,
        size: 30,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.builder(
        itemCount: uploadedItems.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, int index) {
          return Card(
            margin: EdgeInsets.all(1),
            elevation: 3,
            child: ListTile(
              leading: setImage(uploadedItems[index].imageURL),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Text>[Text(uploadedItems[index].itemName ?? 'n/a')],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Row>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Text>[
                      Text(uploadedItems[index].restaurantName ?? 'n/a')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Row>[
                      Row(
                          children: List<Widget>.generate(
                              5,
                              (i) => (() {
                                    if (i <
                                        (uploadedItems[index].rating ?? 0)) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      );
                                    }
                                  }())))
                      // This should be replaced with function to
                      // show a set number of stars instead of num later
                    ],
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            itemView(foodItem: uploadedItems[index])));
              },
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
