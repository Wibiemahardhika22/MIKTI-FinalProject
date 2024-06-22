import 'package:firebase_auth/firebase_auth.dart';

class AuthSignUp {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null; // Tidak ada kesalahan
    } catch (e) {
      return e.toString(); // Mengembalikan pesan kesalahan
    }
  }
}
