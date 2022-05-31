import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;
  final Color color;
  final Function() navigator;
  const CustomCircle({Key? key, 
  required this.child, 
  required this.width, 
  required this.height, 
  required this.navigator,
  this.color = Colors.white }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigator,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 2,
            )
          ]
        ),
        child: child
      ),
    );
  }
}
