import 'package:firebase_auth/firebase_auth.dart';

class ProfileUser {
  final firstName;
  final lastName;
  final username;
  final mobile;
  final email;
  final isLoggedIn;

  ProfileUser(
      {this.firstName,
      this.lastName,
      this.username,
      this.mobile,
      this.email,
      this.isLoggedIn: false});
}

class AuthProfile {
  final ProfileUser profile;
  final AuthResult authResult;

  AuthProfile({this.profile, this.authResult});
}
