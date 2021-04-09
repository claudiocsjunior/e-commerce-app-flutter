import 'package:firebase_auth/firebase_auth.dart';

abstract class IauthRepository{
  Future<User> getUser();
  Future<User> getGoogleLogin();

  Future<String> getToken();
  Future logOut();
}