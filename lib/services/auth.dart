import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simba_share/ui/views/views.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  String _email, _password;

  Future<FirebaseUser> get getUser => _auth.currentUser();

  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  Future<FirebaseUser> anonLogin() async {
    AuthResult authResult = await _auth.signInAnonymously();
    FirebaseUser user = authResult.user;
    updateUserData(user);
    return user;
  }

  Future<FirebaseUser> signIn() async {
    try {
      AuthResult user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<void> updateUserData(FirebaseUser user) {
    DocumentReference reportRef = _db.collection('reports').document(user.uid);

    return reportRef.setData({
      'uid': user.uid,
      'lastActivity': DateTime.now()
    }, merge: true);
  }
  
  Future<void> signOut() {
    return _auth.signOut();
  }
}
