import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../itemPage/itemView.dart';

import 'package:spread/foodItemObject/foodItem.dart';

class favView extends StatelessWidget {
  final List<String> entries = <String>[
    "First placeholder",
    "Second placeholder",
    "Third placeholder"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Text>[Text('Favorites')],
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: favList(),
    );
    throw UnimplementedError();
  }
}

class favList extends StatelessWidget {
  var testFood = foodItem(
      itemName: 'Burger',
      categoryOfFood: 'American',
      rating: 3,
      ingredients: ['Beef', 'Lettuce', 'Cheese', 'Bun', 'Ketchup', 'Mustard'],
      allergens: ['Gluten'],
      restaurantName: 'McDongles',
      restaurantId: 'A0000',
      imageURL: '-',
      tags: ['Yum', 'Spicy']);

  final List<String> entries = <String>[
    "First placeholder",
    "Second placeholder",
    "Third placeholder"
  ];

  List<foodItem> foodEntries = <foodItem>[];

  addSomething() {
    foodEntries.add(testFood);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    addSomething();
    // Adding test food to list

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
              title: Text(entries[index]),
              subtitle: Text('Item Star Rating'),
              trailing: IconButton(
                  onPressed: (null),
                  icon: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => itemView()));
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
