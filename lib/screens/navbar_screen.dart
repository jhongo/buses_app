import 'package:buses_tesis/screens/screens.dart';
import 'package:buses_tesis/service/navbar_service.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
   
  const NavBarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:_HomeBobyMain(),
      bottomNavigationBar: _ButtonNavBar(),


      
    );
  }
}

class _ButtonNavBar extends StatelessWidget {
  const _ButtonNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opcSeleted = Provider.of<NavBarService>(context);
    return BottomNavyBar(
      selectedIndex: opcSeleted.seletedMenuOptGet,
      onItemSelected: (index){
        opcSeleted.seletedMenuOptSet = index;
      },
      iconSize: 20,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      backgroundColor: Color(0xffEBE9D9),
      
      
      items: [
        BottomNavyBarItem(
          
          icon: FaIcon(FontAwesomeIcons.bus),
          title:Text('Mi bus'), 
          activeColor:  Color(0xffEA5055),
          inactiveColor: Color(0xff294171),
           ),

        BottomNavyBarItem(
          icon: FaIcon(FontAwesomeIcons.linesLeaning), 
          title:Text('Líneas'),  
          activeColor: Color(0xffEA5055),
          inactiveColor: Color(0xff294171), ),
        
        BottomNavyBarItem(
          icon: FaIcon(FontAwesomeIcons.map), 
          title:Text('Mapa'),  
          activeColor: Color(0xffEA5055),
          inactiveColor: Color(0xff294171), ),
      ], 
      );
  }
}


class _HomeBobyMain extends StatelessWidget {

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
      
      default:
      return HomeScreen();
    }
  }
}