import 'package:flutter/material.dart';

class Background_Menu extends StatelessWidget {
  final Widget child;
  const Background_Menu({
    required this.child,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //Provides us with total height and width of our screen
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
        ],
      ),
    );
  }
}