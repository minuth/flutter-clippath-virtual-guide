import 'dart:math';

import 'package:flutter/widgets.dart';

class StarClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final centerPoint = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
      final n = 5;
      final eachDegree = 360 / n;
      final path = Path();
      int k = 0;
      for (var i = 0; i < n; i++) {
        final degree = (k*eachDegree) + 270; // start from degree 270
        final radian = degreeToRadian(degree);
        final drawPoint = Offset(cos(radian) * radius, sin(radian) * radius) + centerPoint;
        if(i == 0){
          path.moveTo(drawPoint.dx, drawPoint.dy);
        }
        else{
          path.lineTo(drawPoint.dx, drawPoint.dy);
        }
        k += 2;
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