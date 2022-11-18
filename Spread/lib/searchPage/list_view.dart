// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:spread/itemPage/itemView.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'dart:math';

import 'package:spread/dbObjects/foodItem.dart';

List<FoodItem> savedItems = [];

List<FoodItem> foodEntries = <FoodItem>[];
// Global variable?

class launchListTile extends StatefulWidget {
  const launchListTile({super.key});

  @override
  State<launchListTile> createState() => _launchListTile();
}

bool isFav = false; // TODO: isFav will need to be grabbed from db

class _launchListTile extends State<launchListTile> {
  // final List<String?> entries = <String>[
  //   "First placeholder",
  //   "Second placeholder",
  //   "Third placeholder"
  // ];
  // final starRatings = List<int>.generate(3, (i) => Random().nextInt(6));
  // // final isFavorite = List<bool>.generate(3, (i) => Random().nextBool());
  final isFavorite = <bool>[false, false, false];
  final starRatings = <int>[1, 3, 5];

  Icon unfav = Icon(Icons.star_border);
  Icon fav = Icon(
    Icons.star,
    color: Colors.yellow,
  );
  Icon? showIcon;
  int favIconNum = 0;

  List<FoodItem> savedEntries = <FoodItem>[];

  populateEntries() {
    // foodEntries.add(t1);
    // foodEntries.add(t2);
    // foodEntries.add(t3);
    // foodEntries.add(t4);
    // foodEntries.add(t5);
  }

  populateFavorites(index) {
    if (savedItems.contains(foodEntries[index])) {
      print('Already in saved');
    } else {
      savedItems.add(foodEntries[index]);
    }
    print(savedItems[index].itemName.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodEntries.length,
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Text>[Text(foodEntries[index].itemName ?? 'n/a')],
            ) /*Text(foodEntries[index].itemName)*/,
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Row>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Text>[
                    Text(foodEntries[index].restaurantName ?? 'n/a')
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        5,
                        (i) => (() {
                              if (i < (foodEntries[index].rating ?? 0)) {
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
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                populateFavorites(index);
              },
              // Test onPressed Save
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          itemView(foodItem: foodEntries[index])));
            },
          ),
        );
      },
    );
  }
}
