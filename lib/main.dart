import 'package:buses_tesis/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material App',
      initialRoute: 'select',
      debugShowCheckedModeBanner: false,
      routes: {
        'register': (context) => const  RegisterScreen(),
        'home' :(context) => const HomeScreen(),
        'mapa': (context) => const MapaScreen(),
        'lineas':(context) => const LineasScreen(),
        'perfil': (context) => const PerfilScreen(),
        'select':(context) => const SelectAvatarScreen(),
        'navbar':(context) => const NavBarScreen()
      },
    );
  }
}