import 'package:flutter/material.dart';
import 'package:gerenciaai/src/home/home_page/home_page_controller.dart';

class NotasController extends ChangeNotifier {
  final List<NotaModel> _notas = [
    NotaModel(
      notaName: 'Nota um',
      notaData: '11 Set 2001',
      notaDescription: 'Essa nota foi do servico de vender droga',
      notaPrice: 200.00,
    ),
    NotaModel(
      notaName: 'Nota dois',
      notaData: '23 Jan 2023',
      notaDescription: 'Essa nota foi do servico de vender rins',
      notaPrice: 1000.00,
    ),
    NotaModel(
      notaName: 'Nota tres',
      notaData: '05 Maio 2023',
      notaDescription: 'Essa nota foi do servico de vender gente',
      notaPrice: 2000.00,
    ),
    NotaModel(
      notaName: 'Nota quatro',
      notaData: '11 Set 2001',
      notaDescription: 'Essa nota foi do servico de vender droga',
      notaPrice: 200.00,
    ),
    NotaModel(
      notaName: 'Nota cinco',
      notaData: '23 Jan 2023',
      notaDescription: 'Essa nota foi do servico de vender rins',
      notaPrice: 1000.00,
    ),
    NotaModel(
      notaName: 'Nota seis',
      notaData: '05 Maio 2023',
      notaDescription: 'Essa nota foi do servico de vender gente',
      notaPrice: 2000.00,
    ),
  ];
  List<NotaModel> get notas => _notas;

  TextEditingController search = TextEditingController();

  List<NotaModel> searchNotas() {
    final searchTerm = search.text.toLowerCase();
    if (searchTerm.isEmpty) {
      return _notas;
    } else {
      final filteredNotas = _notas.where((nota) {
        return nota.notaName.toLowerCase().contains(searchTerm) ||
            nota.notaData.toLowerCase().contains(searchTerm) ||
            nota.notaDescription.toLowerCase().contains(searchTerm);
      }).toList();
      notifyListeners();
      return filteredNotas;
    }
  }
}
