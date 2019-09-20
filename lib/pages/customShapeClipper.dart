import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width , size.height);
    var firstControlPoint = Offset(size.width , size.height );
    path.quadraticBezierTo(firstControlPoint.dx,firstControlPoint.dy,firstEndPoint.dx,firstEndPoint.dy);

    // var secondEndPoint = Offset(size.width * .5, size.height);
    // var secondControlPoint = Offset(size.width * 0.25, size.height - 50.0);
    // path.quadraticBezierTo(secondControlPoint.dx,secondControlPoint.dy,secondEndPoint.dx,secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}