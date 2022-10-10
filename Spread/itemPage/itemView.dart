import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../userPage/userView.dart';

class itemView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: profileAppBar(
        appBar: AppBar(),
      ),

      body: Center(
        child: Text(
            'Placeholder body'
        ),
      ),
    );
  }
}