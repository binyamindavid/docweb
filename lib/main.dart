import 'package:docweb/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:docweb/actions/auth_service_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:docweb/middleware/logger.dart';
import 'package:docweb/reducers/auth_reducer.dart';
import 'package:docweb/store/data_store.dart';
import 'package:redux/redux.dart';

import 'package:firebase/firebase.dart' as Firebase;

Future<void> main() async {
  if (Firebase.apps.isEmpty) {
    print(Firebase.apps);
    Firebase.initializeApp(
        apiKey: "AIzaSyBEoGnSlePV86NILdVLCEcFnXq0C69t8pI",
        authDomain: "docweb-1a252.firebaseapp.com",
        databaseURL: "https://docweb-1a252.firebaseio.com",
        projectId: "docweb-1a252",
        storageBucket: "docweb-1a252.appspot.com",
        messagingSenderId: "996751923239",
        appId: "1:996751923239:web:8515c2a215d7633d5b1602");
  }

  runApp(DocApp());
}

class DocApp extends StatelessWidget {
  final Store<AppDataStore> store = new Store<AppDataStore>(
    AuthReducers.authReducer,
    initialState: AppDataStore.initState(),
    middleware: [LoggerMiddleware.loggingMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    //store.dispatch(new AppDataStore.initState());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Image.asset('images/logo.png', width: 80, fit: BoxFit.cover),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        //body: LoginScreen(),
        //body: AuthService().handleAuth(),
        body: StoreProvider<AppDataStore>(
          store: store,
          child: AuthService().handleAuth(),
        ),
      ),
    );
  }
}
