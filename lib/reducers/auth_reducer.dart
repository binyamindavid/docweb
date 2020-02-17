import 'package:docweb/models/profile_user.dart';
import 'package:docweb/store/data_store.dart';

class AuthReducers {
  static AppDataStore authReducer(AppDataStore state, action) {
    if (action == Actions.signIn) {
      ProfileUser profile = ProfileUser(
          email: state.authProfile.authResult.user.email,
          username: state.authProfile.authResult.user.displayName,
          mobile: state.authProfile.authResult.user.phoneNumber);
      AuthProfile prof = AuthProfile(
          authResult: state.authProfile.authResult, profile: profile);

      return new AppDataStore(authProfile: prof);
    }

    return AppDataStore();
  }
}
