import 'package:firebase_auth/firebase_auth.dart';

class AuthResult {
  final User? user;
  final String? error;

  AuthResult({this.user, this.error});

  bool ok() {
    return user != null;
  }
}

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<AuthResult> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult(user: userCredential.user);
    } catch (error) {
      print('Failed to register user: $error');
      return AuthResult(error: error.toString());
    }
  }

  static Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult(user: userCredential.user);
    } catch (error) {
      print('Failed to sign in: $error');
      return AuthResult(error: error.toString());
    }
  }

  static User? getCurrentUser() {
    try {
      return _auth.currentUser;
    } catch (error) {
      print('Failed to get current user: $error');
      return null;
    }
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print('Failed to sign out: $error');
    }
  }
}
