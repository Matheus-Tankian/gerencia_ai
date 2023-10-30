import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      await userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'O usuario ja está cadastrado';
      }
      return 'Erro desconhecido';
    }
  }

  Future<String?> userLogin({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return 'O usuario não está cadastrado';
      }
      return 'Erro desconhecido';
    }
  }
}
