import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:better_with_friends/screens/components/background_login.dart';
import 'package:better_with_friends/screens/Inital_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';


List<String> HabitNames = <String>[];
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size; //Provides us with total height and width of our screen
   return Background_Login(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[const Text("Welcome to AccountABuddy",
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)
      ),
        TextButton(
            style:
            TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
            ),
            onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                );
              },
            child: Text("LOGIN")),
        const SizedBox(height: 16),
        TextButton(
            style:
            TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
              foregroundColor:Colors.black,
              backgroundColor: Colors.grey,
            ),
            onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
            );
            },
            child: Text("SIGNUP"))
      ],
   ),
   );
  }
}

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final myController = TextEditingController();
  final passController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    passController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body:
      Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: myController,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(),
        labelText: 'Enter your new username',
          ),
          ),
          TextFormField(
            controller: passController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your new password',
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
          onPressed: () async {
            //comment
            try {
              UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: myController.text,
                  password: passController.text

              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }

            Navigator.pop(context);
          },
          child: const Text('Signup'),
        ),
    ]
      ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final myController = TextEditingController();
  final passController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    passController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
              SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: myController.text,
                        password: passController.text,
                    );
                    if (userCredential != null) {

                     FirebaseDatabase database = FirebaseDatabase.instance;
                      DatabaseReference ref = FirebaseDatabase.instance.ref("Habits/" + FirebaseAuth.instance.currentUser!.uid);
                      ref.onValue.listen((DatabaseEvent event){
                       final data = event.snapshot.value;
                       String TempHabitNames = data.toString();
                       final re = RegExp('^[0-9]:');
                       List<String> check =[];
                       HabitNames = TempHabitNames.split('},'); //NOTE: HAVE TO RESTART APPLICATION TO CHANGE PRINT STATEMENT
                       print(HabitNames);// THIS SHOULD DO IT JUST GOTTA BREAK THIS DOWN MORE
                      });
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => initalMenu()));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }


                },
                child: const Text('Login'),

              ),
            ]
        ),
      ),
    );
  }
}


