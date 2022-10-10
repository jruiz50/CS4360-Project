
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:spread/main.dart';

class loginView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
              ]
            )
          ),
          child: Container(

            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(

              children:  <Widget>[
                //Fork & Spoon Image
                Padding(padding: const EdgeInsets.only(top: 30.0,),
                  child: Image.asset('lib/loginAssets/forkSpoon.png',
                    scale: 2.5,
                  ),
                ),

                //Crave Text
                Text("Crave",
                  style: GoogleFonts.tangerine(fontSize: 100),
                ),

                //Email Field
                TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color:Colors.black, width: 2.0)
                      ),
                      hintText: "Enter Email",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: "Email",
                      labelStyle: const TextStyle(
                          color: Colors.white
                      )
                  ),
                ),

                //Password Field
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color:Colors.black, width: 2.0)
                      ),
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                          color: Colors.white
                      )
                  ),
                ),

                //Sign In Button
                Padding(padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side:const BorderSide(color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Sign In'),
                    ),
                  ),
                ),

                //Create Account Button
                Padding(padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side:const BorderSide(color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Create Account'),
                    ),
                  ),
                ),

                //Guest Button
                Padding(padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: "Crave")));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side:const BorderSide(color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Continue as Guest'),
                    ),
                  ),
                ),

          //Google Sign In Button
          Padding(padding: const EdgeInsets.only(top: 25),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child:
              SignInButton(
                Buttons.Google,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.black,
                      width: 2.0),
                ),
                onPressed: () {},
              ),
            ),
          ),


              ],
            ),
          ),
        ),
      ),
    );

  }

}