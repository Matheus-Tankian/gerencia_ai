import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
  }) {
    _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }
}
