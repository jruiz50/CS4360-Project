import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:spread/dbObjects/foodItem.dart';
import 'package:spread/favPage/favView.dart';
import '../foodItemObject/foodItem.dart';
import '../userPage/userView.dart';

// This'll probably get combined with "foodItemObject" because it's going to use all the same info

class itemView extends StatelessWidget {
  //final this.foodItem = foodItem;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: ItemAppBar(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.fastfood,
              size: 400,
            ), // Absolutely a placeholder; change it Image()
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Row>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Icon>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[Text('Item Type')],
                    ),
                    Row(
                      children: <Text>[Text('Description')],
                    ),
                    Row(
                      children: <Text>[Text('Ingredients')],
                    ),
                    Row(
                      children: <Text>[Text('Notable Allergens: ')],
                    ),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <TextButton>[
            TextButton(onPressed: null, child: Text("Save")),
            TextButton(onPressed: null, child: Text("Route"))
          ],
        ),
      ),
    );
  }
}

class ItemAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const ItemAppBar({super.key, required this.appBar});

  //const SearchAppBar({Key key, this.appBar, this.widgets}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.greenAccent,
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Row>[
              Row(
                children: <Text>[Text('Name Placeholder')],
              ),
              Row(
                children: <Text>[Text('Restaraunt Placeholder')],
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

class ItemViewNew extends StatelessWidget {
  final FoodItem foodItem;

  ItemViewNew({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: ItemAppBarNew(
        appBar: AppBar(),
        foodItem: foodItem,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.fastfood,
              size: 400,
            ), // Absolutely a placeholder; change it Image()
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Row>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Icon>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 50,
                        ),
                      ],
                    ),
                    Row(
                      children: <Text>[Text(foodItem.categoryOfFood)],
                    ),
                    Row(
                      children: <Text>[Text(foodItem.itemName)],
                      // Should be item description
                    ),
                    Row(
                      children: <Text>[Text(foodItem.ingredients.join(', '))],
                      // Turn this into a listtile!!
                    ),
                    Row(
                      children: <Text>[Text(foodItem.allergens.join(', '))],
                      // Also make this a listtile!!!
                    ),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <TextButton>[
            TextButton(onPressed: null, child: Text("Save")),
            TextButton(onPressed: null, child: Text("Route"))
          ],
        ),
      ),
    );
  }
}

class ItemAppBarNew extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final FoodItem foodItem;
  const ItemAppBarNew(
      {super.key, required this.appBar, required this.foodItem});

  //const SearchAppBar({Key key, this.appBar, this.widgets}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.greenAccent,
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Row>[
              Row(
                children: <Text>[Text(foodItem.itemName)],
              ),
              Row(
                children: <Text>[Text(foodItem.restaurantName)],
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
