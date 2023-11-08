import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gerenciaai/services/authentication_service.dart';
import 'package:gerenciaai/services/get_notas_fiscasi_servicies.dart';
import 'package:gerenciaai/services/get_storage.dart';
import 'package:gerenciaai/src/home/models/nota_model.dart';

class HomePageController extends ChangeNotifier {
  final BoxStorage _boxStorage = BoxStorage();
  final GetNotasFiscaisServicies _getNotasFiscaisServicies =
      GetNotasFiscaisServicies();

  int aux = 0;

  String _userName = '';
  String get userName => _userName;

  List<NotaModel> filteredNotas = [];

  final List<NotaModel> _notas = [];
  List<NotaModel> get notas => _notas;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<double> valoresMensais = [];

  double total = 0.0;

  HomePageController() {
    inicia();
    notifyListeners();
  }

  Future<void> inicia() async {
    _getNotasFiscaisServicies.consultarNotas().listen((listaDeNotas) {
      _notas.clear();
      _notas.addAll(listaDeNotas);
      filteredNotas = [];

      //searchNotas('11/2023');
      passaMes();
      isLoadingFunc();
      notifyListeners();
    });
  }

  void passaMes() {
    searchNotas('01/2023');
    log(total.toString());
    valoresMensais[0] = total;

    // if (i == 1) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 2) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 3) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 4) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 5) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 6) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 7) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 8) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 9) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 10) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }
    // if (i == 11) {
    //   searchNotas('01/2023');
    //   valoresMensais[i] = total;
    // }

    //createBarChartGroups();

    // notifyListeners();
  }

  changeUserName(String value) {
    _userName = value;
    notifyListeners();
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
    changeUserName(name);
    // authenticationService.setupAuthStateListener();
  }

  Stream<List<NotaModel>> consultarNotas() {
    return _getNotasFiscaisServicies.consultarNotas();
  }

  Future<void> isLoadingFunc() async {
    await Future.delayed(const Duration(seconds: 1));
    await changeIsLoading(false);
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
