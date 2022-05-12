import 'package:flutter/material.dart';

class SelectAvatarScreen extends StatelessWidget {
   
  const SelectAvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BackgroundMain(
        child: Column(
          children: const [
            SizedBox(height: 70,),
            _TitleAvatar(),
            SizedBox(height: 100,),
            Text('Descubre tu personaje!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
            SizedBox(height: 50),
            _sliderContainer(),
            SizedBox(height: 40,),
            _Botones()
          ]),
      )
    );
  }
}

class _Botones extends StatelessWidget {
  const _Botones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      // color: Colors.white,
      child: Row(
        children:[
          Container(
            width: 80,
            height: 50,
            alignment: Alignment.center,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Omitir',style: TextStyle(fontSize: 17,  ),),
                Icon(
              Icons.arrow_forward_ios_rounded,size: 16,
            )
              ],
            )

          ),
         
          const SizedBox( width: 59,),
          Container(
            width: 170,
            height: 50,
            
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text('Continuar', style: TextStyle(fontSize: 17),),
          )
        ],
      ),


    );
  }
}

class _sliderContainer extends StatelessWidget {
  const _sliderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      color: Colors.white,
      child: const Center(child: Text('Aquí va el Slider', style: TextStyle(fontSize: 20),)),

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