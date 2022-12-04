import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:spread/dbObjects/foodItem.dart';
import 'package:spread/favPage/favView.dart';
import 'package:spread/searchPage/list_view.dart';
import 'package:flutter_spinbox/material.dart';
import '../userPage/userView.dart';
import 'package:cloud_functions/cloud_functions.dart';

// This'll probably get combined with "foodItemObject" because it's going to use all the same info

class itemView extends StatelessWidget {
  //final this.foodItem = foodItem;

  FoodItem foodItem;
  int itemRate = 0;

  itemView({Key? key, required this.foodItem}) : super(key: key);

  setImage(url) {
    if (url != null) {
      return SizedBox(
        height: 300,
        width: 300,
        child: Image.network(url, errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.fastfood,
            size: 300,
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
    TextEditingController _textFieldController = TextEditingController();

    return Scaffold(
      appBar: ItemAppBar(
        appBar: AppBar(),
        foodItem: foodItem,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                setImage(foodItem.imageURL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      5,
                      (i) => (() {
                            if (i < (foodItem.rating ?? 0)) {
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
                  Flexible(child: Text('Food Category: ')),
                  Flexible(child: Text(foodItem.categoryOfFood ?? 'n/a'))
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(child: Text('Food Name: ')),
                  Flexible(child: Text(foodItem.itemName ?? 'n/a'))
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(child: Text('Ingredients: ')),
                  Flexible(
                      child: Text(foodItem.ingredients?.join(', ') ?? 'n/a'))
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(child: Text('Allergens: ')),
                  Flexible(child: Text(foodItem.allergens?.join(',') ?? 'n/a'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: SpinBox(
                      min: 1,
                      max: 5,
                      value: 0,
                      onChanged: (value) {
                        itemRate = value.toInt();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ElevatedButton(
                          onPressed: () async {
                            final result = await FirebaseFunctions.instance
                                .httpsCallable('updateFoodRating')
                                .call({
                              "rating": itemRate,
                              "foodItemID": foodItem.foodItemID
                            });
                          },
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
        // color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <TextButton>[
            TextButton(
              onPressed: () {
                if (savedItems.contains(foodItem)) {
                  print('Item already saved');
                } else {
                  savedItems.add(foodItem);
                }
              },
              child: Text("Save"),
            ),
            // TextButton(onPressed: null, child: Text("Route"))
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
                children: <Widget>[
                  Flexible(
                      child: Text(
                    foodItem.itemName ?? 'n/a',
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                      child: Text(foodItem.restaurantName ?? 'n/a',
                          overflow: TextOverflow.ellipsis))
                ],
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
