import 'package:firebase_auth/firebase_auth.dart';

class AuthLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Tidak ada kesalahan
    } catch (e) {
      return e.toString(); // Mengembalikan pesan kesalahan
    }
  }
}
