import 'dart:math';

import 'package:flutter/widgets.dart';

class OpenUmbrellarClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    final n = 8;
    final eachDegree = 360 / n;
    final path = Path();
    for (var i = 0; i < n; i++) {
      final startDegree = eachDegree * i;
      final startRadian = degreeToRadian(startDegree);
      final startPoint = Offset(cos(startRadian) * radius, sin(startRadian) * radius) + centerPoint;

      final middleDegree = startDegree + (eachDegree / 2);
      final middleRadian = degreeToRadian(middleDegree);
      final middlePoint = Offset(cos(middleRadian) * (radius* 0.85), sin(middleRadian) * (radius*0.85)) + centerPoint;

      final endDegree = eachDegree * (i+1);
      final endRadian = degreeToRadian(endDegree);
      final endPoint = Offset(cos(endRadian) * radius, sin(endRadian) * radius) + centerPoint;
      if(i == 0 ){
          path.moveTo(startPoint.dx, startPoint.dy);
          path.quadraticBezierTo(middlePoint.dx, middlePoint.dy, endPoint.dx, endPoint.dy);
      }
      path.quadraticBezierTo(middlePoint.dx, middlePoint.dy, endPoint.dx, endPoint.dy);
    } 
    path.close();   
    return path;
  }
  
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }

  double degreeToRadian(double degree) => (degree * pi) / 180;
  
}