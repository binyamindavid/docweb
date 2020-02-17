import 'package:docweb/models/profile_user.dart';

enum Actions {
  signOut,
  signIn,
}

class AppDataStore {
  AppDataStore({this.authProfile});

  final AuthProfile authProfile;

  AppDataStore.initState() : authProfile = AuthProfile();
}
