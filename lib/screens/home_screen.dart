import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffEA5055),

        child: Stack(
          children: const [
            Positioned(top: 80, right: 0, child: _TitleHome()),
            Positioned(right: 0, bottom: 0, child: ContainerSearch()),
            Positioned(top: 150, left: 18 , child: _CircleDecoration()),

          ],          
        ),
      ) 
    );
  }
}

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.75,
      color: const Color(0xffEBE9D9), 
      
      
    );
  }
}

class _CircleDecoration extends StatelessWidget {
  const _CircleDecoration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
      color: const Color(0xffEBE9D9),
      shape: BoxShape.circle,
      border: Border.all(
        color: Color(0xffEA5055),
        width: 5
      )
      ),
    );
  }
}

class _TitleHome extends StatelessWidget {
  const _TitleHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:const [
          Text('Kevin', style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
          Text('Encontremos tu bus..', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w400 ),),

        ],
      ),
      
    );
  }
}

