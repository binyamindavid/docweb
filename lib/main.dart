import 'package:docweb/auth_service.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Image.asset('images/logo.png', width: 80, fit: BoxFit.cover),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: AuthService().handleAuth(),
      ),
    ),
  );
}