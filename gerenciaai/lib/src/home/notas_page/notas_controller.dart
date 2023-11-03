import 'package:flutter/material.dart';
import 'package:gerenciaai/services/get_notas_fiscasi_servicies.dart';
import 'package:gerenciaai/src/home/models/nota_model.dart';

class NotasController extends ChangeNotifier {
  final GetNotasFiscaisServicies _getNotasFiscaisServicies =
      GetNotasFiscaisServicies();
  final List<NotaModel> _notas = [];

  List<NotaModel> get notas => _notas;

  TextEditingController search = TextEditingController();

  List<NotaModel> filteredNotas = [];

  void searchNotas(String value) {
    final searchTerm = value.toLowerCase();
    if (searchTerm.isEmpty || searchTerm == '') {
      filteredNotas = _notas;
    } else {
      filteredNotas = _notas.where((nota) {
        return nota.notaName.toLowerCase().contains(searchTerm) ||
            nota.notaData.toLowerCase().contains(searchTerm) ||
            nota.notaDescription.toLowerCase().contains(searchTerm);
      }).toList();

      filteredNotas;
    }

    if (filteredNotas.isEmpty) {
      filteredNotas = [];
    }
    notifyListeners();
  }

  Stream<List<NotaModel>> consultarNotas() {
    return _getNotasFiscaisServicies.consultarNotas();
  }
}
