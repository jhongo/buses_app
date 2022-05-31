import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: CustomPaint(
          painter: BackgroundPerfil(),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              _TextPerfil(),
              SizedBox(
                height: 180,
              ),
              _TagCuenta(
                label: 'Mi cuenta',
                textContent: 'keygonza10@gmail.com',
              ),
              SizedBox(height: 30,),
              _NumCard(),
              SizedBox(height: 90,),
              _OpcPerfil(icon: Icons.exit_to_app,text: 'Cerrar sesión', ),
              SizedBox(height: 35,),
              _OpcPerfil(icon: Icons.help,text: 'Ayuda', )
            ],
          ),
        ),
      ),
    );
  }
}

class _OpcPerfil extends StatelessWidget {
  final IconData icon;
  final String text;
  const _OpcPerfil({
    Key? key, 
    required this.icon, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(

        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFFc4c7c5),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 25,),
          Text(text, style: TextStyle(color: Color(0xff294171)),)
        ],
      ),
    );
  }
}

class _NumCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFFc4c7c5),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.monetization_on_outlined,
              color: Colors.white,
            ),
          ),
          MaterialButton(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Consultar mi saldo',
                  style: TextStyle(
                    color: Color(0xff294171),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Ingresa tu # de tarjeta',
                    style: TextStyle(color: Colors.black45))
              ],
            ),
            onPressed: () {
              displayDialogIOS(context);
            },
          )
        ],
      ),
    );
  }
}

void displayDialogIOS(BuildContext context) {
  showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Ingresa tu número'),
          content: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contenido del AlertDialog'),
              SizedBox(
                height: 10,
              ),
              // Image.asset('assets/gifs/busin_gino.gif')
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('OK'))
          ],
        );
      });
}

class _TagCuenta extends StatelessWidget {
  final String label;
  final String textContent;
  final IconData icon;
  const _TagCuenta({
    Key? key,
    required this.label,
    required this.textContent,
    this.icon = Icons.arrow_forward_ios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFFc4c7c5),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    color: Color(0xff294171), fontWeight: FontWeight.bold),
              ),
              Text(
                textContent,
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Spacer(),
          Icon(
            icon,
            color: Color(0xff294171),
          )
        ],
      ),
    );
  }
}

class _TextPerfil extends StatelessWidget {
  const _TextPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.centerRight,
        width: double.infinity,
        child: Text(
          'Perfil',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class BackgroundPerfil extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = Color(0xff294171);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 10;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.15);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.15);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
