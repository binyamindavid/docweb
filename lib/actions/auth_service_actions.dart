import 'package:docweb/models/profile_user.dart';
import 'package:docweb/reducers/auth_reducer.dart';
import 'package:docweb/store/data_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:docweb/home_screen.dart';
import 'package:docweb/login_screen.dart';
import 'package:flutter/material.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  // Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      AuthReducers.authReducer(
          AppDataStore(authProfile: AuthProfile(authResult: user)), signIn);

      print('Signed in ${user.runtimeType}');
    }).catchError((e) {
      print(e);
    });
  }
}
