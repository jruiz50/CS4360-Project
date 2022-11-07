import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:spread/dbObjects/foodItem.dart';
import 'package:spread/favPage/favView.dart';
import '../foodItemObject/foodItem.dart';
import '../userPage/userView.dart';
// import 'package:flutter_spinbox/cupertino.dart';

// This'll probably get combined with "foodItemObject" because it's going to use all the same info

class itemView extends StatelessWidget {
  //final this.foodItem = foodItem;

  final FoodItem foodItem;

  itemView({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController _textFieldController = TextEditingController();

    return Scaffold(
      appBar: ItemAppBar(
        appBar: AppBar(),
        foodItem: foodItem,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.fastfood,
                  size: 400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      5,
                      (i) => (() {
                            if (i < foodItem.rating) {
                              return Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 40,
                              );
                            } else {
                              return Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 40,
                              );
                            }
                          }())),
                ),
              ],
            ),
          ),
          new Container(
              child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(child: Text(foodItem.categoryOfFood))
                ],
              ),
              Row(
                children: <Widget>[Flexible(child: Text(foodItem.itemName))],
              ),
              Row(
                children: <Widget>[
                  Flexible(child: Text(foodItem.ingredients.join(', ')))
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(child: Text(foodItem.allergens.join(',')))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ElevatedButton(
                          onPressed: () {
                            AlertDialog(
                              title: Text('Enter Rating'),
                              content: TextField(
                                onChanged: (value) {},
                                controller: _textFieldController,
                                decoration: InputDecoration(
                                    hintText: 'Enter rating between 1-5'),
                              ),
                            );
                          }, // Open dialog to change rating
                          // This still needs to be changed; button is lit up but does nothing!!!

                          child: Text('Change Rating'))
                    ],
                  )
                ],
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <TextButton>[
            TextButton(
              onPressed: null,
              child: Text("Save"),
            ),
            TextButton(onPressed: null, child: Text("Route"))
          ],
        ),
      ),
    );
  }
}

class ItemAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final FoodItem foodItem;
  const ItemAppBar(
      {super.key, required this.appBar, required FoodItem this.foodItem});

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

/*class ItemViewNew extends StatelessWidget {
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
                      children: <Widget>[
                        Flexible(child: Text(foodItem.categoryOfFood))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(child: Text(foodItem.itemName))
                      ],
                      // Should be item description
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(child: Text(foodItem.ingredients.join(', ')))
                      ],
                      // Turn this into a listtile!!
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(child: Text(foodItem.allergens.join(', ')))
                      ],
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
}*/
