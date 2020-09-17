import 'dart:math';

import 'package:flutter/widgets.dart';

class TriangleClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(centerPoint.dx, centerPoint.dy);
    final n = 3;
    final eachDegree = 360 / 3;
    final path = Path();
    for (var i = 0; i < n; i++) {
      final degree = (i*eachDegree) + 270; // start from 270 degree
      final radian = degreeToRadian(degree);
      final drawPoint = Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint; // cos: X coordinate, sin: Y coordinate
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