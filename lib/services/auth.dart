import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lums_social_app2/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creating a user object based on Firebase User.

  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in anonymously
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user1 = result.user;

      return _userFromFirebaseUser(user1);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  MyUser? registerWithEmailAndPassword(
      String email, String password, String name) {
    try {
      Future<UserCredential> result = _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user1;
      result.then((value) => {
            user1 = value.user,
            FirebaseFirestore.instance
                .collection("users")
                .doc(value.user?.uid)
                .set({
              "email": value.user?.email,
              "password": password,
              "name": name
            })
          });

      return _userFromFirebaseUser(user1);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Forgot password implementation
  Future forgotPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return 10;
    }
  }
}
