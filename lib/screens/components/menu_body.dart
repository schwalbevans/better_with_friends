
import 'package:better_with_friends/screens/components/background_menu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class menuBody extends StatefulWidget {
  HomePage createState()=> HomePage();
}
class HomePage extends State<menuBody>{
  @override
  String dropdownvalue = "Daily";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Habits/Andy");
  final habitController = TextEditingController();
  final passController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    habitController.dispose();
    passController.dispose();
  }

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

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Daily"),value: "Daily"),
      DropdownMenuItem(child: Text("Weekly"),value: "Weekly"),
      DropdownMenuItem(child: Text("Biweekly"),value: "Biweekly"),
      DropdownMenuItem(child: Text("Monthly"),value: "Monthly"),
      DropdownMenuItem(child: Text("BiYearly"),value: "BiYearly"),
      DropdownMenuItem(child: Text("Annually"),value: "Annually"),
    ];
    return menuItems;
  }

void openDialog(context) => showDialog( builder: (context) => AlertDialog(
    title: Text('New Habit'),
    content: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  //position
  mainAxisSize: MainAxisSize.min,

  // wrap content in flutter
  children: <Widget>[
  TextField(
    controller: habitController,
  decoration: InputDecoration(hintText: 'Enter your Habit Name'),
  ),
    DropdownButtonFormField(
        value: dropdownvalue,
        onSaved: (String? newValue){
      setState(() {
        dropdownvalue = newValue!;
      });
    },
      onChanged: (String? newValue){
      setState(() {
        dropdownvalue = newValue!;
      });
    },items: dropdownItems, )
  ]
    ),

    actions: [
      TextButton(onPressed: () async {
        await ref.set({
            "HabitName": habitController.text,
            "Frequency": dropdownvalue//TODO: Add a numofhabits variable for each user to keep track of how many they have
        });
        Navigator.pop(context);
        }, child: Text('SUBMIT')),
    ],
  ), context:context,
  );
}
