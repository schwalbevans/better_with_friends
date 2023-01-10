
import 'package:better_with_friends/screens/components/background_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:better_with_friends/screens/components/body.dart';

class menuBody extends StatefulWidget {
  HomePage createState()=> HomePage();
}

class HomePage extends State<menuBody>{
  @override
  String dropdownvalue = "Daily";
  //FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference ref = FirebaseDatabase.instance.ref("Habits/" + FirebaseAuth.instance.currentUser!.uid);

 // ref.onChildAdded.listen((event)) {

  //}
  final habitController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();


  var data;
  get userId => null;


  void dispose() {
    // Clean up the controller when the widget is disposed.
    habitController.dispose();
    passController.dispose();
  }

  void addItemToList() {
    setState(() {
      HabitNames.insert(0, "hello");//Change to input actual data from the database
    });
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
      Expanded(
      child: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: HabitNames.length,
      itemBuilder: (BuildContext context, int index) {
      return Container(
      height: 50,
      margin: EdgeInsets.all(2),
      child: Center(
      child: Text('${HabitNames[index]})',
      style: TextStyle(fontSize: 18),
      )
      )
      );
      },
      ),
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
        ref = FirebaseDatabase.instance.ref();
        DataSnapshot snapshot = await ref.child('Habits/' + FirebaseAuth.instance.currentUser!.uid).get();
        //This is pulling the whole habits, including the num of the habits
        Object? temp = snapshot.value;
        var numOfHabits = temp.toString();

        int find = numOfHabits.indexOf("numOfHabits");
        int final_num = int.parse(numOfHabits[find + 13]);
        if (snapshot.exists) {
          ref = FirebaseDatabase.instance.ref("Habits/" + FirebaseAuth.instance.currentUser!.uid + "/" );
          var tempHab = final_num;
          tempHab += 1;
          await ref.update({
            "numOfHabits": tempHab,
          });
          ref = FirebaseDatabase.instance.ref("Habits/" + FirebaseAuth.instance.currentUser!.uid + "/" + tempHab.toString());
          await ref.set({
            "habitName": habitController.text,
            "Frequency": dropdownvalue
          });

        } else {
          ref = FirebaseDatabase.instance.ref("Habits/" + FirebaseAuth.instance.currentUser!.uid);
          //print('No data available.');
          await ref.set({
            "NumOfHabits": "1",
          });
          ref = FirebaseDatabase.instance.ref("Habits/" + FirebaseAuth.instance.currentUser!.uid + "/1");
          await ref.set({
          "HabitName": habitController.text,
          "Frequency": dropdownvalue
          });
        }

        Navigator.pop(context);
        addItemToList();

        }, child: Text('SUBMIT')),
    ],
  ), context:context,
  );
}

