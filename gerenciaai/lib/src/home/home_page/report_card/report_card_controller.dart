import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/services/get_notas_fiscasi_servicies.dart';
import 'package:gerenciaai/src/home/models/nota_model.dart';

class ReportController extends ChangeNotifier {
  final GetNotasFiscaisServicies _getNotasFiscaisServicies =
      GetNotasFiscaisServicies();
  List<NotaModel> filteredNotas = [];

  TextEditingController anoController = TextEditingController();

  TextEditingController anoMesController = TextEditingController();

  TextEditingController mesController = TextEditingController();

  final List<NotaModel> _notas = [];
  List<NotaModel> get notas => _notas;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  double total = 0.0;

  ReportController() {
    _getNotasFiscaisServicies.consultarNotas().listen((listaDeNotas) {
      _notas.clear();
      _notas.addAll(listaDeNotas);
      filteredNotas = [];
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
      filteredNotas = [];
    } else {
      filteredNotas = _notas.where((nota) {
        return nota.notaData.toLowerCase().contains(searchTerm);
      }).toList();
      total = 0.0;
      for (final value in filteredNotas) {
        double price = double.tryParse(value.notaPrice) ?? 0.0;
        total += price;
      }
    }
    log('total $total');
    notifyListeners();
  }

  Future<void> isLoadingFunc() async {
    await Future.delayed(const Duration(seconds: 1));
    await changeIsLoading(false);
    notifyListeners();
  }
}
