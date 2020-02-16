import 'package:docweb/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else
      return false;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250.0,
          width: 300.0,
          child: Column(
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
                        child: Container(
                          height: 50.0,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Email'),
                            validator: (value) => value.isEmpty
                                ? 'Email is required'
                                : validateEmail(value.trim()),
                            onChanged: (value) {
                              this.email = value;
                            },
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
                        child: Container(
                          height: 50.0,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'),
                            validator: (value) =>
                                value.isEmpty ? 'Password is required' : null,
                            onChanged: (value) {
                              this.password = value;
                            },
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.deepOrange,
                        onPressed: () {
                          if (checkFields()) {
                            AuthService().signIn(email, password);
                          }
                        },
                        child: Container(
                          height: 40.0,
                          width: 100.0,
                          child: Center(child: Text('Sign in ')),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
