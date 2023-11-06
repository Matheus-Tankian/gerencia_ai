import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/services/get_notas_fiscasi_servicies.dart';
import 'package:gerenciaai/src/home/models/nota_model.dart';

class NotasController extends ChangeNotifier {
  final GetNotasFiscaisServicies _getNotasFiscaisServicies =
      GetNotasFiscaisServicies();

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final List<NotaModel> _notas = [];

  List<NotaModel> get notas => _notas;

  TextEditingController search = TextEditingController();

  List<NotaModel> filteredNotas = [];

  NotasController() {
    // Adicione a inicialização no construtor
    _getNotasFiscaisServicies.consultarNotas().listen((listaDeNotas) {
      _notas.clear();
      _notas.addAll(listaDeNotas);
      filteredNotas = _notas;
      isLoadingFunc();
      notifyListeners();
    });
  }

  changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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
    }

    for (final value in filteredNotas) {
      log(value.notaData);
      log(value.notaDescription);
      log(value.notaName);
      log(value.notaPrice);
    }

    notifyListeners();
  }

  Future<void> isLoadingFunc() async {
    await Future.delayed(const Duration(seconds: 1));
    await changeIsLoading(false);
  }
}
