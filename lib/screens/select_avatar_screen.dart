import 'package:flutter/material.dart';

class SelectAvatarScreen extends StatelessWidget {
   
  const SelectAvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BackgroundMain(
        child: Column(
          children:const [
            SizedBox(height: 70,),
            _TitleAvatar(),
            SizedBox(height: 120,),
            Text('Descubre tu personaje!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),)
          
            
          ]),
      )
    );
  }
}

class _TitleAvatar extends StatelessWidget {
  const _TitleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const [
          Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 20,),),
          Text('Kevin', style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
          

        ],
      ),
    );
  }
}

class _BackgroundMain extends StatelessWidget {

  final Widget child;

  const _BackgroundMain({
    Key? key,required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Color(0xffEA5055),
      child: child,
    );
  }
}