import 'package:buses_tesis/models/slider_models.dart';
import 'package:buses_tesis/screens/screens.dart';
import 'package:buses_tesis/service/navbar_service.dart';
import 'package:buses_tesis/service/select_parada_service.dart';
import 'package:buses_tesis/service/show_modal_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavBarService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ModalService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SliderModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectParadaService(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'navbar', 
        debugShowCheckedModeBanner: false,
        routes: {
          'register': (context) => const RegisterScreen(),
          'home': (context) => const HomeScreen(),
          'mapa': (context) => const MapaScreen(),
          'lineas': (context) => const LineasScreen(),
          'perfil': (context) =>  PerfilScreen(),
          'select': (context) => const SelectAvatarScreen(),
          'navbar': (context) => const NavBarScreen(),
          'destino': (context) => DestinoScreen(),
          'parada' :(context) => ParadaScreen(),
        },
      ),
    );
  }
}
