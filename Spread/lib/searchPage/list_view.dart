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
bool toggle = false;

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
    /*foodEntries.add(t1);
    foodEntries.add(t2);
    foodEntries.add(t3);
    foodEntries.add(t4);
    foodEntries.add(t5);*/
  }

  populateFavorites(index) {
    if (savedItems.contains(foodEntries[index])) {
      print('Already in saved');
    } else {
      savedItems.add(foodEntries[index]);
    }
    print(savedItems[index].itemName.toString());
  }

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
    return ListView.builder(
      itemCount: foodEntries.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, int index) {
        return Card(
          margin: const EdgeInsets.all(1),
          elevation: 3,
          child: ListTile(
            leading: setImage(foodEntries[index].imageURL),
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
            trailing: IconButton(
              onPressed: () {
                if (savedItems.contains(foodEntries[index])) {
                  savedItems.remove(foodEntries[index]);
                  setState(() {});

                  // Add to list, change color to yellow
                } else {
                  savedItems.add(foodEntries[index]);
                  setState(() {});
                  // Remove from list, change icon color to grey
                }
              },
              icon: (savedItems.contains(foodEntries[index])
                  ? Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  : Icon(
                      Icons.star,
                      color: Colors.grey,
                    )),
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
