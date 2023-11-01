import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gerenciaai/services/authentication_service.dart';
import 'package:gerenciaai/services/get_storage.dart';

class HomePageController extends ChangeNotifier {
  final BoxStorage _boxStorage = BoxStorage();

  int aux = 0;

  String _userName = '';
  String get userName => _userName;

  final List<NotaModel> _notasRecentes = [
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
  ];

  changeUserName(String value) {
    _userName = value;
    log('value: $value');
    notifyListeners();
  }

  List<NotaModel> get notasRecentes => _notasRecentes;

  List<BarChartGroupData> createBarChartGroups(List<double> dataList) {
    final List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < dataList.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: dataList[i],
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      );
    }

    return barGroups;
  }

  String getUserName() {
    if (aux == 0) {
      getNome();
    }
    aux++;
    return userName;
  }

  Future<void> getNome() async {
    String name = '';
    String email = await _boxStorage.userEmail.read('email');
    AuthenticationService authenticationService = AuthenticationService();
    name = await authenticationService.getUserName(email: email);
    log(name);
    changeUserName(name);
  }
}

LinearGradient get _barsGradient => const LinearGradient(
      colors: [
        Color(0xffdd2300),
        Color(0xffff4700),
        Color(0xffff6625),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

//esse modelo e temporario

class NotaModel {
  final String notaName;
  final String notaData;
  final String notaDescription;
  final double notaPrice;

  NotaModel({
    required this.notaDescription,
    required this.notaName,
    required this.notaData,
    required this.notaPrice,
  });
}
