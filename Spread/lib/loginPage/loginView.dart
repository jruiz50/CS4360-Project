import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spread/creationPage/createAccView.dart';
import 'package:spread/main.dart';
import 'package:spread/searchPage/list_view.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView>
    with SingleTickerProviderStateMixin {
  final eController = TextEditingController();
  final pController = TextEditingController();
  double imgOpacity = 0.0;
  double fieldOpacity = 0.0;
  double buttonOpacity = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      imgOpacity = 1;
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 3), () {
      fieldOpacity = 1;
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 5), () {
      buttonOpacity = 1;
      setState(() {});
    });
  }

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
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Fork & Spoon Image
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: imgOpacity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                      ),
                      child: Image.asset(
                        'lib/loginAssets/forkSpoon.png',
                        scale: 2.5,
                      ),
                    ),
                  ),

                  //Crave Text
                  AnimatedOpacity(
                    opacity: imgOpacity,
                    duration: const Duration(seconds: 1),
                    child: Text(
                      "Crave",
                      style: GoogleFonts.tangerine(fontSize: 100),
                    ),
                  ),

                  //Email Field
                  AnimatedOpacity(
                    opacity: fieldOpacity,
                    duration: const Duration(seconds: 1),
                    child: TextField(
                      controller: eController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0)),
                          hintText: "Enter Email",
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: "Email",
                          labelStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  //Password Field
                  const SizedBox(height: 10),
                  AnimatedOpacity(
                    opacity: fieldOpacity,
                    duration: const Duration(seconds: 1),
                    child: TextField(
                      controller: pController,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0)),
                          hintText: "Enter Password",
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  //Sign In Button
                  AnimatedOpacity(
                    opacity: buttonOpacity,
                    duration: const Duration(seconds: 1),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              final userCredential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: eController.text,
                                      password: pController.text);
                              debugPrint("Signed in successfully.");
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyHomePage(title: "Crave")));
                            } on FirebaseAuthException catch (e) {
                              print(e);
                              eController.text = "";
                              pController.text = "";
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          child: const Text('Sign In'),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: buttonOpacity,
                    duration: const Duration(seconds: 1),
                    child: Row(
                      children: const <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                        Text("OR"),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          height: 36,
                        ))
                      ],
                    ),
                  ),

                  //Create Account Button
                  AnimatedOpacity(
                    opacity: buttonOpacity,
                    duration: const Duration(seconds: 1),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const createAccView()));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          child: const Text('Create Account'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
