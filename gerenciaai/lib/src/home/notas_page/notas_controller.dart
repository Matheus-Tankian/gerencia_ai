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

  bool _disposed = false;

  NotasController() {
    inicia();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void inicia() {
    _getNotasFiscaisServicies.consultarNotas().listen((listaDeNotas) {
      if (_disposed) return;
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

    notifyListeners();
  }

  Future<void> isLoadingFunc() async {
    await Future.delayed(const Duration(seconds: 1));
    if (_disposed) return;
    await changeIsLoading(false);
  }
}
