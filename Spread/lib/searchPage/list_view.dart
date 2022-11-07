import 'package:flutter/material.dart';
import 'package:spread/itemPage/itemView.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'dart:math';

import '../foodItemObject/foodItem.dart';

class launchListViewGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey),
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
                  const Text('Item name'),
                  const Text('Item Rating'),
                  const Text('Star Rating'),
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

class _launchListTile extends State<launchListTile> {
  final List<String> entries = <String>[
    "First placeholder",
    "Second placeholder",
    "Third placeholder"
  ];
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

  var testFoodOne = FoodItem(
      itemName: 'Steak',
      categoryOfFood: 'American',
      rating: 3,
      ingredients: ['Beef', 'Potatoes', 'Asparagus'],
      allergens: [],
      restaurantName: 'Steak Place',
      restaurantId: 'A0003',
      imageURL: '-',
      tags: ['Yum', 'Spicy']);

  var testFoodTwo = FoodItem(
      itemName: 'Salad',
      categoryOfFood: 'Italian',
      rating: 5,
      ingredients: [
        'Lettuce',
        'Cheese',
        'Tomato',
        'Pesto',
      ],
      allergens: [],
      restaurantName: 'Olib Gardin',
      restaurantId: 'A0001',
      imageURL: '-',
      tags: ['Spicy']);

  var testFoodThree = FoodItem(
      itemName: 'Ramen',
      categoryOfFood: 'Japanese',
      rating: 4,
      ingredients: ['water', 'ice', 'salt'],
      allergens: [],
      restaurantName: 'Another Ramen Place',
      restaurantId: 'A0004',
      imageURL: '-',
      tags: ['Expensive']);

  List<FoodItem> foodEntries = <FoodItem>[];

  List<FoodItem> savedEntries = <FoodItem>[];

  populateEntries() {
    foodEntries.add(testFoodOne);
    foodEntries.add(testFoodTwo);
    foodEntries.add(testFoodThree);
  }

  onFavoritePress(index) {
    // if isFav; remove from savedEntries
    // if isntFav; add to savedEntries

    if (savedEntries.contains(foodEntries[index])) {
      savedEntries.remove(savedEntries[index]);

      setState(() {
        isFavorite[index] = !isFavorite[index];
        print(isFavorite[index]);
      });
    } else {
      savedEntries.add(foodEntries[index]);

      setState(() {
        isFavorite[index] = !isFavorite[index];
        print(isFavorite[index]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TODO: will need to implement a way to do this for food items in db.
    // This is somehow connecting all 3 food items as one object, which is why
    // clicking on the fav button does the action for all three objects.
    // This is at least a start
    populateEntries();

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
              children: <Text>[Text(foodEntries[index].itemName)],
            ) /*Text(foodEntries[index].itemName)*/,
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Row>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Text>[Text(foodEntries[index].restaurantName)],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        5,
                        (i) => (() {
                              if (i < foodEntries[index].rating) {
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
                onPressed: () {
                  /*setState(() {
                    isFavorite[index] = !isFavorite[index];
                    print(isFavorite[index]);
                  });*/
                  // onFavoritePress(index);
                },
                icon: (isFavorite[index]) ? fav : unfav),
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

    // throw UnimplementedError();
  }
}

class launchGuestListTile extends StatelessWidget {
  final List<String> entries = <String>[
    "First placeholder",
    "Second placeholder",
    "Third placeholder"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
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
            title: Text('Food Name'),
            subtitle: Text('Item Star Rating'),
          ),
        );
      },
    );
    // throw UnimplementedError();
  }
}
