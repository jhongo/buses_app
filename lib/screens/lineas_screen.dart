import 'package:animate_do/animate_do.dart';
import 'package:buses_tesis/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LineasScreen extends StatelessWidget {
   
  const LineasScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Color(0xFFecebd9),
      body: Container(
        color: Color(0xFFecebd9),
        width: size.width,
        height: size.height,
        child: FadeInDown(
          child: CustomPaint(
            painter:BackgroundLineas(),
            child: Column(
              children: [
                SizedBox(height: 120,),
                _TextLineas(),
                SizedBox(height: 50,),
                Hero(
                  tag: 'custom-circle-1',
                  child: CustomCircle(
                    width: 250,
                    height: 250,
                    child: SliderNumber(),
                    navigator: () => Navigator.pushReplacementNamed(context, 'parada'),
                  ),
                ),
                SizedBox(height: 20,),
                _ImageLines()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliderNumber extends StatelessWidget {
  const SliderNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 50,
              top: 50,
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 160,
                child: PageView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Image.asset('assets/imgs/R16.png', scale: 4,),
                Image.asset('assets/imgs/R22.png', scale: 4,),
                Image.asset('assets/imgs/R25.png', scale: 4,),
                
                    
              ],
                    ),
              ),
            )
          ],
        );
  }
}


class _TextCircle extends StatelessWidget {

  final String name;
  const _TextCircle({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$name', style: TextStyle(fontSize: 100, color: Color(0xFF294171), fontWeight: FontWeight.bold),);
  }
}


class _ImageLines extends StatelessWidget {
  const _ImageLines({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/imgs/catedral.png'),
    );
  }
}

class _TextLineas extends StatelessWidget {
  const _TextLineas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('¿Qué línea quieres tomar?', style: TextStyle(color: Colors.white, fontSize: 20),);
  }
}


class BackgroundLineas extends CustomPainter  {
  @override
  void paint(Canvas canvas, Size size) {
    
    final pencil = Paint();
    pencil.color = Color(0xFF294171);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 10;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height*0.3);
    path.quadraticBezierTo(size.width * 0.5 , size.height * 0.6 , size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }
  
}