import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/dbObjects/userProfile.dart';
import 'package:spread/itemPage/itemView.dart';
import 'package:spread/searchPage/list_view.dart';

import '../dbObjects/foodItem.dart';

class menuView extends StatelessWidget {
  var scannedItems;
  menuView({Key? key, required this.scannedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(scannedItems);
    uploadedItems.clear();
    for (var i = 0; i < scannedItems.length; i++) {
      uploadedItems.add(FoodItem.fromJson(scannedItems[i]));
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Text>[Text('Scanned Items')],
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

  /*makeList() async {
    final result = await FirebaseFunctions.instance
        .httpsCallable('getUserMenus')
        .call({'userID': FirebaseAuth.instance.currentUser?.uid ?? ""});

    for (var i = 0; i < result.data['results'].length; i++) {
      foodEntries.add(FoodItem.fromJson(result.data['results'][i]));
    }
  }*/

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
                children: <Widget>[
                  Flexible(
                      child: Text(
                    uploadedItems[index].itemName ?? 'n/a',
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Row>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                        uploadedItems[index].restaurantName ?? 'n/a',
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                          5,
                          (i) => (() {
                                if (i < (uploadedItems[index].rating ?? 0)) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  );
                                } else {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  );
                                }
                              }())))
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
