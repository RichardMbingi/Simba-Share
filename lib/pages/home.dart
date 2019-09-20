import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'customShapeClipper.dart';

Color firstColor = Color(0xf2544e);
Color secondColor = Color(0xfeb580);

class Home extends StatefulWidget {

  const Home({Key key,@required this.user}) : super(key: key);

  final AuthResult user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopPart()],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: <Widget>[
         ClipPath(
           clipper: CustomShapeClipper(),
           child: Container(
             height: 400.0,
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [firstColor, secondColor])
              ),
           ),
         ),
       ],
    );
  }
}