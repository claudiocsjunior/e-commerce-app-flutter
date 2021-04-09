import 'package:firebase_auth/firebase_auth.dart';

abstract class IauthRepository{
  Future<User> getUser();
  Future<User> getGoogleLogin();

  Future<User> register({String email, String password});
  Future<User> getEmailLogin();

  Future<String> getToken();
  Future logOut();
}