import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up method
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Sign Up Error: $e");
      return null;
    }
  }

  // Sign in method
  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Sign In Error: $e");
      return null;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Current user method
  User? get currentUser => _auth.currentUser;
}
