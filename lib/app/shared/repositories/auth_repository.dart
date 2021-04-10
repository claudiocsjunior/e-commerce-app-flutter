import 'package:e_commerce_app/app/shared/interfaces/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IauthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

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
  Future logOut() async {
    await _auth.signOut();
  }

  @override
  Future<User> getEmailLogin({String email, String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());

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
  Future<User> register({String email, String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());

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

  @override
  Future<User> setName(String name) async{
    try{
      User user = _auth.currentUser;
      await user.updateProfile(displayName: name);
      user = _auth.currentUser;
      return user;
    }catch(e){
      throw e;
    }

  }

  @override
  Future<User> setEmail(String email) async{
    try{
      User user = _auth.currentUser;
      if(email.trim() != user.email.trim()){
        await user.updateEmail(email);
        user = _auth.currentUser;
      }
      return user;
    }on FirebaseException catch(e){
      if(e.code == "requires-recent-login"){
        throw Exception(["É necessário um login recente. Faça login novamente para poder realizar a operação."]);
      }
      throw e.code;
    }catch(e){
      throw e;
    }

  }

  @override
  Future<User> setPassword(String password) async{
    try{
      User user = _auth.currentUser;
      await user.updatePassword(password);
      user = _auth.currentUser;
      return user;
    }on FirebaseException catch(e){
      if(e.code == "requires-recent-login"){
        throw Exception(["É necessário um login recente. Faça login novamente para poder realizar a operação."]);
      }
      throw e.code;
    }catch(e){
      throw e;
    }

  }


}
