import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simba_share/ui/views/loginView.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username, _password, _email, _confirm_password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            //!Username textfield
            // TextFormField(
            //   validator: (input) {
            //     if (input.isEmpty) {
            //       return 'Create a username';
            //     }
            //   },
            //   decoration: InputDecoration(labelText: 'Username'),
            //   onSaved: (input) => _username = input,
            // ),

            //?Email textfield
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Create a email';
                }
              },
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (input) => _email = input,
            ),

            //?Password textfield
            TextFormField(
              obscureText: true,
              validator: (input) {
                if (input.length < 6) {
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(labelText: 'Password'),
              onSaved: (input) => _password = input,
            ),

            //!Confirm password textfield
            // TextFormField(
            //   validator: (input) {
            //     if (input.isEmpty) {
            //       return 'Create a username';
            //     }
            //   },
            //   decoration: InputDecoration(labelText: 'Confirm password'),
            //   onSaved: (input) => _confirm_password = input,
            // ),

            //?Sign up button
            RaisedButton(
              child: Text('Sign Up'),
              //TODO: sign up functionality
              onPressed: signUp,
            ),

            //?Log in link
            FlatButton(
              child: Text('Already have an account? \nLog in'),
              onPressed: loginViewLink,
            )
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  void loginViewLink() {
    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

//TODO: Create username registration
//TODO: Confirm password validation
