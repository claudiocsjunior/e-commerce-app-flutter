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
    User user = FirebaseAuth.instance.currentUser;

    if(user != null){
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
    }

    return user;
  }

  @override
  Future logOut() async{
    await FirebaseAuth.instance.signOut();
  }

}