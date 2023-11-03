import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetNotasFiscaisServicies {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> consultarNotas() async {
    try {
      // Acesse o documento 'nota' dentro do caminho '/notasFiscais/HHXwS0Pm4xUOLJnxbia6'.
      final QuerySnapshot notaDocument = await _firebaseFirestore
          .collection('notasFiscais')
          .where('token', isEqualTo: 'token1')
          .get();

      // .collection('notasFiscais')
      // .doc('HHXwS0Pm4xUOLJnxbia6')
      // .collection('nota')
      // .doc('ID_DO_DOCUMENTO')
      // .get();

      if (notaDocument.docs.isNotEmpty) {
        // Aqui você pode acessar os dados do documento 'nota'.
        Map<String, dynamic> data =
            notaDocument.docs.first.data() as Map<String, dynamic>;
        print('Dados do documento "nota": $data');
      } else {
        print('O documento "nota" não existe.');
      }
    } catch (e) {
      print('Erro ao consultar os dados: $e');
    }
  }

  Future<void> addNotasToken({
    required String nomeNota,
    required String data,
    required String valor,
    required String descricao,
  }) async {
    try {
      DocumentReference notasFiscaisDocRef =
          await FirebaseFirestore.instance.collection('notasFiscais').add({
        'token': 'tokenEx2',
      });

      await notasFiscaisDocRef.collection('nota').add({
        'data': data,
        'descricao': descricao,
        'nomeNota': nomeNota,
        'valorNota': valor,
      });
    } catch (e) {
      log('Erro ao adicionar documentos: $e');
    }
  }

  Future<void> consultarNotasPorToken(String token) async {
    try {
      QuerySnapshot notasSnapshot = await FirebaseFirestore.instance
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
