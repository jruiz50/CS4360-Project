import 'package:flutter/material.dart';
import 'package:spread/main.dart';
import 'package:spread/loginPage/loginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class createAccView extends StatefulWidget {
  const createAccView({super.key});

  @override
  State<createAccView> createState() => _createAccViewState();
}

class _createAccViewState extends State<createAccView> {
  final fController = TextEditingController();
  final lController = TextEditingController();
  final eController = TextEditingController();
  final p1Controller = TextEditingController();
  final p2Controller = TextEditingController();

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
                  controller: fController,
                  decoration: InputDecoration(
                      hintText: "Enter First Name", labelText: "First Name")),
              TextField(
                controller: lController,
                  decoration: InputDecoration(
                      hintText: "Enter Last Name", labelText: "Last Name")),
              TextField(
                controller: eController,
                  decoration: InputDecoration(
                      hintText: "Enter Email", labelText: "Email")),
              TextField(
                controller: p1Controller,
                obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password")),
              TextField(
                controller: p2Controller,
                obscureText: true,
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
                    onPressed: () async {
                      if (p1Controller.text == p2Controller.text) {
                        try {
                          final user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: eController.text.toLowerCase(),
                              password: p2Controller.text);
                          try {
                            final result = await FirebaseFunctions.instance
                                .httpsCallable('createUserProfile').call({
                              "firstName": fController.text,
                              "lastName": lController.text,
                              "userID": FirebaseAuth.instance.currentUser?.uid
                            });
                            print(result.data);
                          } on FirebaseFunctionsException catch (e) {
                            print(e);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const MyHomePage(title: "Crave")));
                        } on FirebaseAuthException catch (e) {
                          print(e);
                          eController.text = "";
                          p1Controller.text = "";
                          p2Controller.text = "";
                        }
                      } else {
                        p1Controller.text = "";
                        p2Controller.text = "";
                      }
                    },
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
