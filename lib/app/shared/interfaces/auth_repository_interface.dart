import 'package:firebase_auth/firebase_auth.dart';

abstract class IauthRepository{
  Future<User?> getUser();
  Future<User> getGoogleLogin();

  Future<User?> register({required String email, required String password});
  Future<User?> getEmailLogin({required String email, required String password});

  Future<String> getToken();
  Future logOut();


  Future<User> setName(String name);
  Future<User> setEmail(String name);
  Future<User> setPassword(String name);
}