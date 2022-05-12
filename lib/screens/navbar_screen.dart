import 'package:buses_tesis/screens/screens.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
   
  const NavBarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageView(
        children: [
          HomeScreen()
        ],
      ),

      
    );
  }
}