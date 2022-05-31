
import 'package:buses_tesis/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';


class NavBarScreen extends StatelessWidget {
   
  const NavBarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFecebd9),
      body: HomeBobyMain(),
      bottomNavigationBar: CustomNavBar(),
      
    );
  }
}

