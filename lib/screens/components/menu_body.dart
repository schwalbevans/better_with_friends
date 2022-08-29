
import 'package:better_with_friends/screens/components/background_menu.dart';
import 'package:flutter/material.dart';

class menuBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background_Menu(child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[Text("List of Habits",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)

    ),
    ],
    ),
    );
  }
}
