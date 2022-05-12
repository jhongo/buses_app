import 'package:buses_tesis/screens/screens.dart';
import 'package:buses_tesis/service/navbar_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavBarService(),)
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'register',
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
      ),
    );
  }
}