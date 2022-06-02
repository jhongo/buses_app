import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width:size.width,
        height: size.height,
        child: CustomPaint(
          painter: BackgroundRegister(),
          child: Column(
            children:const [
              SizedBox(height: 400,),
              _TextContinue(),
              SizedBox(height: 50,),
              _SocialNetworkButton(text: 'Continuar con Facebook', icon: FontAwesomeIcons.facebookF ),
              SizedBox(height: 30,),
              _SocialNetworkButton(text: 'Continuar con Google', icon: FontAwesomeIcons.google,),
              SizedBox(height: 30,),
              Text('Registrarme', style: TextStyle(color: Color(0xff294171),fontSize: 17 ),),
            ],
          ),
        ),
      )
    );
  }
}

class _SocialNetworkButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const _SocialNetworkButton({
    Key? key, 
    required this.icon, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: MaterialButton(
        height: 65,
        color: Color(0xff294171),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            FaIcon(icon, color: Colors.white,),
            SizedBox(width: 40,),
            Text(text, style: TextStyle(color: Colors.white, fontSize: 15), )
          ],
        ),
        onPressed:() {
          Navigator.pushReplacementNamed(context, 'select');
        },
        ),
    );
  }
}

class _TagRegister extends StatelessWidget {
  
  final String text;
  final IconData icon;
  
  const _TagRegister({
    Key? key, required this.text, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        
      },
      child: Container(
        width: 320,
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xff294171),
          borderRadius: BorderRadius.circular(5)
        ),
        child: _SocialNetworkButton(text: text, icon: icon,)
      ),
    );
  }
}

class _TextContinue extends StatelessWidget {
  const _TextContinue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('¿Cómo quieres continuar?', style: TextStyle(color: Color(0xff294171),fontSize: 20, fontWeight: FontWeight.w800 ),),
    );
  }
}




class BackgroundRegister extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    
    final pencil = Paint();
    pencil.color = Color(0xFF294171);
    pencil.strokeWidth = 10;
    pencil.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.40);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.34 , size.width, size.height * 0.40);
    path.lineTo(size.width,0);

    canvas.drawPath(path, pencil);
  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}