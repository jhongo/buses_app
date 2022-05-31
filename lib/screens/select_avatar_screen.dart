import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SelectAvatarScreen extends StatelessWidget {
   
  const SelectAvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: BackgroundSelected(),
          child: Column(
            children:const [
              _TitleSelectedAvatar(),
              SizedBox(height: 100,),
              _SliderAvatar(),
              SizedBox(height: 55,),
              _ButtonContinuar()
            ],
          ),
        )
      )
    );
  }
}

class _ButtonContinuar extends StatelessWidget {
  const _ButtonContinuar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 70,
      child: Row(
        children: [

          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:const [
              Text('Omitir', style: TextStyle(fontSize: 20,  color: Colors.white),),
              Icon(Icons.arrow_forward_ios, size: 15,color: Colors.white,)
            ],),
          ),
          Spacer(),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'navbar');
            },
            child: Container(
              alignment: Alignment.center,
              width: 170,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffea5055),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2)
                  )
                ]
              ),
              child: Text('Continuar', style: TextStyle(fontSize: 15, color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}

class _SliderAvatar extends StatelessWidget {
  const _SliderAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.4,
      child: Column(
        children: [
          Text('Descubre tu personaje!', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700 ),), 
          SizedBox(height: 50,),
          Container(
          width: size.width,
          height: size.height * 0.3,
            child: Swiper(
              itemCount: 10,
              viewportFraction: 0.6,
              scale: 0.8,
              itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              child: Image.asset('assets/imgs/bus-r4.png',scale: 10 ,),
            );
        },
),
          ),
        ],
      ),
    );
  }
}

class _TitleSelectedAvatar extends StatelessWidget {
  const _TitleSelectedAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:const [
            Text('Bienvenido,', style: TextStyle(fontSize: 20, color: Color(0xFF294171) )),
            Text('Kevin!',style: TextStyle(fontSize: 45,  color: Color(0xFF294171), fontWeight: FontWeight.w800  ), )
          ],
        ),
      ),
    );
  }
}


class BackgroundSelected extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
  
  // Definicion de Lapiz 
  final pencil = Paint();
  pencil.color = Color(0xFF294171);
  pencil.style = PaintingStyle.fill;
  pencil.strokeWidth = 10;

  // Rutas en el canvas
  final path = Path();
  path.moveTo(0, size.height);
  path.lineTo(0, size.height * 0.25 );
  path.quadraticBezierTo(size.width * 0.5 , size.height * 0.15, size.width, size.height * 0.25);
  path.lineTo( size.width, size.height);
  canvas.drawPath(path, pencil);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }
  
}