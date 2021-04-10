import 'package:e_commerce_app/app/shared/interfaces/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IauthRepository{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User> getGoogleLogin() async{
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      return user;
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<User> getUser() async {
    User user = _auth.currentUser;

    // if(user != null){
    //   if (!user.emailVerified) {
    //     await user.sendEmailVerification();
    //   }
    // }

    return user;
  }

  @override
  Future logOut() async{
    await _auth.signOut();
  }

  @override
  Future<User> getEmailLogin({String email, String password}) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );

      final User user = userCredential.user;
      return user;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Nenhum usuário encontrado para esse e-mail.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Senha errada fornecida para esse usuário.');
      }
    }
  }

  @override
  Future<User> register({String email, String password}) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );

      final User user = userCredential.user;
      return user;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception("A senha fornecida é muito fraca.");
      } else if (e.code == 'email-already-in-use') {
        throw Exception('A conta já existe para esse e-mail.');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

}