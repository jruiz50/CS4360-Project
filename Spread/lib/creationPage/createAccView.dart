import 'package:flutter/material.dart';
import 'package:spread/main.dart';
import 'package:spread/loginPage/loginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:google_fonts/google_fonts.dart';

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
      resizeToAvoidBottomInset: false,
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 0.00,
                ),
                child: Image.asset(
                  'lib/loginAssets/forkSpoon.png',
                  scale: 2.5,
                ),
              ),
              Text(
                "Crave",
                style: GoogleFonts.tangerine(fontSize: 100),
              ),
              //First Name Field
              TextField(
                  controller: fController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.black, width: 2.0)),
                      hintText: "Enter First Name",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: "First Name",
                      labelStyle: const TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              // Last Name Field
              TextField(
                  controller: lController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.black, width: 2.0)),
                      hintText: "Enter Last Name",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: "Last Name",
                      labelStyle: const TextStyle(color: Colors.white))),
              const SizedBox(height: 10),
              //Email Field
              TextField(
                  controller: eController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0)),
                    hintText: "Enter Email",
                    hintStyle: const TextStyle(color: Colors.white),
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Colors.white),
                  )),
              const SizedBox(height: 10),
              // Password Field
              TextField(
                  controller: p1Controller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: const TextStyle(color: Colors.white),
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0)),
                  )),
              const SizedBox(height: 10),
              // Re-enter Password Field
              TextField(
                controller: p2Controller,
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0)),
                    hintText: "Re-enter Password",
                    hintStyle: const TextStyle(color: Colors.white),
                    labelText: "Re-enter Password",
                    labelStyle: const TextStyle(color: Colors.white)),
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (p1Controller.text == p2Controller.text) {
                        try {
                          final user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: eController.text.toLowerCase(),
                                  password: p2Controller.text);
                          try {
                            final result = await FirebaseFunctions.instance
                                .httpsCallable('createUserProfile')
                                .call({
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
