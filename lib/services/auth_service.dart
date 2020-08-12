import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/screens/feed_screen.dart';
import 'package:flutter_instagram_clone/screens/login_screen.dart';

class AuthService {

  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUser(BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _firestore.collection('/users').document(signedInUser.uid).setData(
            {
              'name': name,
              'email': email,
              'profileImageUrl': '',
            });
        Navigator.pushReplacementNamed(context, FeedScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  static void login(BuildContext context, String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
      // Navigator.pushReplacementNamed(context, FeedScreen.id);
    } catch (e) {
      print (e);
    }
  }

  static void logout() {
    _auth.signOut();
    // Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

}