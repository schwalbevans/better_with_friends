import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:better_with_friends/constants.dart';
import 'package:better_with_friends/screens/components/background.dart';



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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                primary: Colors.white,
              backgroundColor: Colors.teal,
            ),
            onPressed: (){},
            child: Text("LOGIN")),
        SizedBox(height: 16),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
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
        labelText: 'Enter your username',
          ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your password',
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
          onPressed: () {
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


