import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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

  Future<void> userName({
    required String name,
    required String email,
    required String senha,
  }) async {
    await _firebaseFirestore.collection('users').add({
      'nome': name,
      'email': email,
      'senha': senha,
    });
  }

  Future<String> getUserName({required String email}) async {
    final QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      final userName = userData['nome'] as String;

      return userName;
    } else {
      return '';
    }
  }
}
