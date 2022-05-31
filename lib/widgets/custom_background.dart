import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {

      //Dimeciones del lapiz
      final pencil = Paint();
      pencil.color = Color(0xFF294171);
      pencil.style = PaintingStyle.fill;
      pencil.strokeWidth = 20;

      //Rutas 
      final path = Path();
      path.moveTo(0, 0);
      path.lineTo(0, size.height * 0.3);
      path.quadraticBezierTo(size.width * 0.5, size.height * 0.25, size.width, size.height * 0.3);
      path.lineTo(size.width, 0);
      
      
      canvas.drawPath(path, pencil);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}