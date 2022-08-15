import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:better_with_friends/constants.dart';
import 'package:better_with_friends/screens/components/background.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //Provides us with total height and width of our screen
   return Background(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[const Text("Welcome to AccountABuddy",
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)
      ),
        TextButton(
            style:
            TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                primary: Colors.white,
              backgroundColor: Colors.teal,
            ),
            onPressed: (){},
            child: Text("LOGIN")),
        const SizedBox(height: 16),
        TextButton(
            style:
            TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
              primary: Colors.black,
              backgroundColor: Colors.grey,
            ),
            onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
            );
            },
            child: Text("SIGNUP"))
      ],
   ),
   );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
      decoration: const InputDecoration(
          border: UnderlineInputBorder(),
        labelText: 'Enter your new username',
          ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your new password',
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
          onPressed: () async {
            try {
              UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: "barry.allen@example.com",
                  password: "SuperSecretPassword!"
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


