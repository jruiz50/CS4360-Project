import 'package:flutter/material.dart';
import 'package:spread/main.dart';
import 'package:spread/loginPage/loginView.dart';

class createAccView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.3,
                0.9,
              ],
                  colors: [
                Color(0xB30CDB21),
                Color(0xCC7C4DFF)
              ])),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter First Name", labelText: "First Name")),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Last Name", labelText: "Last Name")),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Email", labelText: "Email")),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password")),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Re-enter Password",
                      labelText: "Re-enter Password")),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: null,
                    child: const Text('Create Account'),
                  ),
                ),
              )
            ])),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
