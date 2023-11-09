import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gerenciaai/services/get_storage.dart';
import 'package:gerenciaai/src/home/models/nota_model.dart';

class GetNotasFiscaisServicies {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final BoxStorage _boxStorage = BoxStorage();

  Stream<List<NotaModel>> consultarNotas() {
    try {
      final Stream<QuerySnapshot> notaDocument = _firebaseFirestore
          .collection('notasFiscais')
          .doc(_boxStorage.userToken.read('token').toString().trim())
          .collection('nota')
          .snapshots();

      Stream<List<NotaModel>> notasStream = notaDocument.map((querySnapshot) {
        List<NotaModel> notas = [];
        if (querySnapshot.docs.isNotEmpty) {
          for (QueryDocumentSnapshot document in querySnapshot.docs) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            NotaModel nota = NotaModel(
              id: document.id,
              notaName: data['nomeNota'],
              notaData: data['data'],
              notaDescription: data['descricao'],
              notaPrice: data['valorNota'],
              linkPdf: data['linkPdf'],
            );
            notas.add(nota);
          }
        }
        return notas;
      });

      return notasStream;
    } catch (e) {
      log('Erro ao consultar os dados: $e');
      return Stream.value([]);
    }
  }

  Future<String> addNotasToken({
    required String nomeNota,
    required String data,
    required String valor,
    required String descricao,
    required String linkPdf,
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
        'linkPdf': linkPdf,
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

  Future<void> excluirNota(String notaId) async {
    try {
      await _firebaseFirestore
          .collection('notasFiscais')
          .doc(_boxStorage.userToken.read('token').toString().trim())
          .collection('nota')
          .doc(notaId)
          .delete();
    } catch (e) {
      print('Erro ao excluir nota: $e');
    }
  }
}
