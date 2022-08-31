



import 'package:better_with_friends/screens/components/background_menu.dart';
import 'package:flutter/material.dart';

class menuBody extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Background_Menu(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Add a Habit')),
          const Text("List of Habits",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)
    ),

    ],

    ),

    );

  }

void openDialog(context) => showDialog( builder: (context) => AlertDialog(
    title: Text('New Habit'),
    content: TextField(
      decoration: InputDecoration(hintText: 'Enter your Habit Name'),
    ),
    actions: [
      TextButton(onPressed: () {}, child: Text('SUBMIT')),
    ],
  ), context:context,
  );
}
