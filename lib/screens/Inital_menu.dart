import 'package:better_with_friends/screens/components/menu_body.dart';
import 'package:flutter/material.dart';


class initalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Main Menu'),),body: menuBody(),);
  }
}
