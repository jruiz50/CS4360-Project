import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spread/itemPage/itemView.dart';
import 'package:spread/searchPage/list_view.dart';

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
  var testFoodOne = FoodItem(
      foodItemID: 'test',
      itemName: 'Burger',
      categoryOfFood: 'American',
      rating: 3,
      ingredients: [
        'Beef',
        'Lettuce',
        'Cheese',
        'Bun',
        'Ketchup',
        'Mustard',
        'LONG TEXT TO TEST WRAPPING AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
      ],
      allergens: ['Gluten'],
      restaurantName: 'McDongles',
      imageURL: '-',
      tags: ['Yum', 'Spicy'],
      restaurantID: 'A0000'
  );

  var testFoodTwo = FoodItem(
      foodItemID: 'test',
      itemName: 'Spaghetti',
      categoryOfFood: 'Italian',
      rating: 5,
      ingredients: [
        'Noodle',
        'Cheese',
        'Tomato',
        'Beef',
        'Pesto',
      ],
      allergens: ['Gluten'],
      restaurantName: 'Olib Gardin',
      restaurantID: 'A0001',
      imageURL: '-',
      tags: ['Spicy']
  );

  var testFoodThree = FoodItem(
      foodItemID: 'test',
      itemName: 'Ramen',
      categoryOfFood: 'Japanese',
      rating: 4,
      ingredients: ['water', 'ice', 'salt'],
      allergens: [],
      restaurantName: 'Ichiraku Ramen',
      restaurantID: 'A0002',
      imageURL: '-',
      tags: ['Expensive']);

  final List<String> entries = <String>[
    "First placeholder",
    "Second placeholder",
    "Third placeholder"
  ];

  List<FoodItem> foodEntries = <FoodItem>[];
  // List<FoodItem> savedEntries = <FoodItem>[];

  addSomething() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    addSomething();
    // Adding test food to list

    return ListView.builder(
        itemCount: savedItems.length,
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
                children: <Text>[Text(savedItems[index].itemName)],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Row>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Text>[Text(savedItems[index].restaurantName)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Row>[
                      Row(
                          children: List<Widget>.generate(
                              5,
                              (i) => (() {
                                    if (i < savedItems[index].rating) {
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
              trailing: IconButton(
                  onPressed: (null),
                  icon: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            itemView(foodItem: savedItems[index])));
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
