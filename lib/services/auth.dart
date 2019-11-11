// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:simba_share/ui/views/views.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final Firestore _db = Firestore.instance;

//   Future<FirebaseUser> get getUser => _auth.currentUser();

//   Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

//   Future<AuthResult> anonLogin() async {
//     AuthResult user = await _auth.signInAnonymously();
//     updateUserData(user);
//     return user;
//   }

//   Future<AuthResult> signIn() async{
//     try {
//         AuthResult user = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: _email, password: _password);
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => DesignCourseHomeScreen(user: user)));
//       } catch (e) {
//         print(e.message);
//       }
// }