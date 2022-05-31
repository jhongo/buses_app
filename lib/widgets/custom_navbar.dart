import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:buses_tesis/screens/screens.dart';
import 'package:buses_tesis/service/navbar_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opcSeleted = Provider.of<NavBarService>(context);
    return Container(
      decoration:const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      ),
      child: GNav(
        gap: 8,
        activeColor: Colors.redAccent,
        backgroundColor: Color.fromARGB(255, 213, 211, 198),
        tabMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        color: Color(0xFF294171),
        tabBackgroundColor: Colors.white70,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: opcSeleted.seletedMenuOptGet,
        padding: EdgeInsets.all(15),
        onTabChange: (index){
          opcSeleted.seletedMenuOptSet = index;
    
        },
        tabs:const [
          GButton(
            icon: FontAwesomeIcons.busSimple,
            text: 'Mi Bus',
            textStyle: TextStyle(fontSize: 15, color: Color(0xFFea5055)),
            
            ),
          GButton(
            icon: FontAwesomeIcons.linesLeaning,
            text: 'Líneas',
            textStyle: TextStyle(fontSize: 15, color: Color(0xFFea5055)),
            
            ),
          GButton(
            icon: FontAwesomeIcons.map,
            text: 'Mapa',
            textStyle: TextStyle(fontSize: 15, color: Color(0xFFea5055)),
            
            ),
          GButton(
            icon: FontAwesomeIcons.user,
            text: 'Perfil',
            textStyle: TextStyle(fontSize: 15, color: Color(0xFFea5055)),
            
            ),
    
        ]
      
      ),
    );
  }
}


class HomeBobyMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final optSelected = Provider.of<NavBarService>(context).seletedMenuOptGet;
    switch (optSelected) {
      case 0:
      return HomeScreen();
      case 1:
      return LineasScreen();
      case 2:
      return MapaScreen();
      case 3:
      return PerfilScreen();
      
      default:
      return HomeScreen();
    }
  }
}