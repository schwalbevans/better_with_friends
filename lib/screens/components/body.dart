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
      children: <Widget>[Text("Welcome to AccountABuddy",
      style: TextStyle(fontWeight: FontWeight.bold)
      ),
        SvgPicture.asset("assets/icons/chat.svg",
        height: size.height * 0.45,
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
            onPressed: (){},
            child: Text("SIGNUP"))
      ],
   ),
   );
  }
}


