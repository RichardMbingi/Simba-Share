import 'package:flutter/material.dart';
import 'package:simba_share/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  TextStyle style = TextStyle(fontFamily: "Manjari", fontSize: 20);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (input) {
        if (input.isEmpty) {
          return 'Please Enter Email Address';
        } //! input validation
      },
      onSaved: (input) => _email = input,
    ); //?Email TextField

    final passwordField = TextFormField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (input) {
        if (input.length < 6) {
          return 'Your password should have at leat 6 characters';
        } //! input validation
      },
      onSaved: (input) => _password = input, 
    ); //?Password TextField

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffbe8E),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: signIn,
      ),
    ); //?Log In Button

    
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/lion.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 35.0),
                loginButton,
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
        // resizeToAvoidBottomPadding: false,
        // body: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomCenter,
        //       stops: [0.1, 1.0],
        //       colors: [
        //         Color(0xFC635D),
        //         Color(0x7E4BFF),
        //       ],
        //     ),
        //   ),
        //   child: Form(
        //     key: _formKey,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: <Widget>[
        //         //?Logo
        //         Padding(
        //           padding: const EdgeInsets.only(top: 120.0, bottom: 40.0),
        //           child: Image(
        //             image: AssetImage('assets/images/logo.svg'),
        //           ),
        //         ),

        //         //?Log Title
        //         Padding(
        //           padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
        //           child: Text(
        //             "Log In",
        //             style: TextStyle(fontSize: 40),
        //           ),
        //         ),



                
        //         // Padding(
        //         //   padding: const EdgeInsets.symmetric(
        //         //       horizontal: 20.0, vertical: 0.0),
        //         //   child: TextFormField(
        //         //     validator: (input) {
        //         //       if (input.isEmpty) {
        //         //         return 'Please Enter Email Address';
        //         //       } //! input validation
        //         //     },
        //         //     onSaved: (input) => _email = input,
        //         //     decoration: InputDecoration(
        //         //       contentPadding:
        //         //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        //         //       hintText: "Email",
        //         //       fillColor: Colors.transparent,
        //         //       border: OutlineInputBorder(
        //         //           borderRadius: BorderRadius.circular(32.0)),
        //         //     ),
        //         //   ),
        //         // ),

                
        //         // Padding(
        //         //   padding: const EdgeInsets.symmetric(
        //         //       horizontal: 20.0, vertical: 0.0),
        //         //   child: TextFormField(
        //         //     validator: (input) {
        //         //       if (input.length < 6) {
        //         //         return 'Your password should have at leat 6 characters';
        //         //       } //! input validation
        //         //     },
        //         //     onSaved: (input) => _password = input,
        //         //     decoration: InputDecoration(
        //         //       contentPadding:
        //         //           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        //         //       hintText: "Password",
        //         //       fillColor: Colors.transparent,
        //         //       border: OutlineInputBorder(
        //         //           borderRadius: BorderRadius.circular(32.0)),
        //         //     ),
        //         //     obscureText: true,
        //         //   ),
        //         // ),

                
        //         // Padding(
        //         //   padding: const EdgeInsets.only(top: 30),
        //         //   child: RaisedButton(
        //         //     onPressed: signIn,
        //         //     child: Text(
        //         //       'Enter',
        //         //     ),
        //         //   ),
        //         // )
        //       ],
        //     ),
        //   ),
        // )
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    } //! input authentication
  }
}
