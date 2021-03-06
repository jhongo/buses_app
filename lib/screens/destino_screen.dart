import 'package:animate_do/animate_do.dart';
import 'package:buses_tesis/class/utils.dart';
import 'package:flutter/material.dart';

class DestinoScreen extends StatefulWidget {

  @override
  State<DestinoScreen> createState() => _DestinoScreenState();
}

class _DestinoScreenState extends State<DestinoScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
  //  displayDialogIOS(context);
    return Scaffold(
      backgroundColor: Color(0xffebe9d9),
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: BackgroundDestino(),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              const _HeaderParada(),
              const SizedBox(height: 40,),
              const Text('Líneas sugeridas', style: TextStyle(fontSize: 18, color: Colors.white,),), 
              const SizedBox(height: 60,),
              _ContentParada(),
              const SizedBox(height: 40,),
              const _ContentImage()
            ],
          ),
        ),
      )
    );
  }
}

class _ContentImage extends StatelessWidget {
  const _ContentImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned( top: 20, child: _CircleBackground()),
            Image.asset('assets/imgs/totems.png'), 
            Positioned( top:80 ,left:65, child: Image.asset('assets/imgs/nube-r1.png', scale: 7,)), 
            Positioned( top:30 ,right:85, child: Image.asset('assets/imgs/nube-r2.png', scale: 7)), 
            
          ],
        ),
      ),
    );
  }
}
class _CircleBackground extends StatelessWidget {
  const _CircleBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: Color(0xffea5055),
        shape: BoxShape.circle
      ),
    );
  }
}

class _ContentParada extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const [
              CircleParada(imgs: 'assets/imgs/R16.png',index: 1,),
              CircleParada(imgs: 'assets/imgs/R22.png',index: 2, ),
              CircleParada(imgs: 'assets/imgs/R25.png',index: 3,),
            ],
          ),

        ),
        Positioned( top: 20, left: 230, child: NumParada()),
        Positioned( top: 20, right: 20, child: NumParada()),
      ],
    );
  }
}

class NumParada extends StatelessWidget {
  const NumParada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(milliseconds: 1500),
      child: Container(
        alignment: Alignment.center,
        width: 25,
        height: 25,
        decoration:BoxDecoration(
          color: Color(0xffea5055),
          shape: BoxShape.circle
        ),
        child: Text('2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
      ),
    );
  }
}

class CircleParada extends StatelessWidget {

  final String imgs;
  final int index;
  const CircleParada({Key? key, required this.imgs, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 300 ),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xffebe9d9), 
          shape: BoxShape.circle,
          border: Border.all(
            width: 5,
            color: Color(0xFF294971)
          )
        ),
      child: Image.asset(imgs, scale: 7,),
      ),
    );
  }
}

class _HeaderParada extends StatelessWidget {
  const _HeaderParada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'navbar');
              },
              child: Icon(Icons.arrow_back_ios_rounded, size: 30,color: Colors.white,)), 
            const Spacer(),
            const Text('Los Tótems', style: TextStyle(fontSize:20 ,  color: Colors.white,fontWeight: FontWeight.w700 ),)
          ],
        ),
      ),
    );
  }
}

class BackgroundDestino extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final pencil = Paint();
    pencil.color = Color(0xFF294971);
    pencil.style = PaintingStyle.fill; 
    pencil.strokeWidth = 20;

    final path = Path();
    path.moveTo(0,0);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.18 , size.width, size.height * 0.25 );
    path.lineTo(size.width, 0);
  canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}