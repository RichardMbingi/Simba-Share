import 'package:firebase_auth/firebase_auth.dart';
import 'package:simba_share/homeScreen.dart';
import 'package:simba_share/designCourse/homeDesignCourse.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
//?Logo
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(labelText: 'Password'),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign in'),
              ),
              new FlatButton(
                child: new Text('Create an account'),
                onPressed: userRegister,
              )
            ],
          )),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DesignCourseHomeScreen(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }

  void userRegister() {
    
  }
}
