import 'dart:math';

import 'package:flutter/widgets.dart';

class OctagonClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final centerPoint = Offset(size.width /2 , size.height /2 );
    final radius = (min(size.width, size.height) / 2);
    final path = Path();
    final numberCorner = 8;
    final eachDegree = 360 / numberCorner;
    for (var i = 0; i < numberCorner; i++) {
      final degree = (i * eachDegree);
      final radian = degreeToRadian(degree);
      final drawPoint = Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint;

      if(i == 0){
        path.moveTo(drawPoint.dx, drawPoint.dy);
      }
      else{
        path.lineTo(drawPoint.dx, drawPoint.dy);
      }
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