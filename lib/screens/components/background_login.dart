import 'package:flutter/material.dart';

class Background_Login extends StatelessWidget {
  final Widget child;
  const Background_Login({
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
          Positioned(
            top: 0,
            left: 125,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            bottom:0,
            left: 125,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}