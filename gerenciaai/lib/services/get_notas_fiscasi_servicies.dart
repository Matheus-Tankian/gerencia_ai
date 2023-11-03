import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gerenciaai/services/get_storage.dart';

class GetNotasFiscaisServicies {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final BoxStorage _boxStorage = BoxStorage();

  Future<void> consultarNotas() async {
    log('consultar');
    try {
      final Stream<QuerySnapshot> notaDocument = _firebaseFirestore
          .collection('notasFiscais')
          .doc(_boxStorage.userToken.read('token').toString().trim())
          .collection('nota')
          .snapshots();

      notaDocument.listen((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          log('tem');
          for (QueryDocumentSnapshot document in querySnapshot.docs) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            log('Dados do documento "nota": $data');
          }
        } else {
          log('Nenhum documento "nota" encontrado.');
        }
      });
    } catch (e) {
      log('Erro ao consultar os dados: $e');
    }
  }

  Future<String> addNotasToken({
    required String nomeNota,
    required String data,
    required String valor,
    required String descricao,
  }) async {
    try {
      await _firebaseFirestore
          .collection('notasFiscais')
          .doc(_boxStorage.userToken.read('token').toString().trim())
          .collection('nota')
          .add({
        'data': data,
        'descricao': descricao,
        'nomeNota': nomeNota,
        'valorNota': valor,
      });
    } catch (e) {
      log('Erro ao adicionar documentos: $e');
      return 'Erro ao adicionar documentos: $e';
    }

    return 'sucesso';
  }

  Future<void> consultarNotasPorToken(String token) async {
    try {
      QuerySnapshot notasSnapshot = await _firebaseFirestore
          .collectionGroup('nota')
          .where('token', isEqualTo: token)
          .get();

      for (QueryDocumentSnapshot notaDocument in notasSnapshot.docs) {
        Map<String, dynamic> data = notaDocument.data() as Map<String, dynamic>;
        log('Dados do documento "nota": $data');
      }
    } catch (e) {
      log('Erro ao consultar os dados: $e');
    }
  }
}
