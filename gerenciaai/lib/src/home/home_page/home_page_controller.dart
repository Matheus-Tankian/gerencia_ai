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

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final List<NotaModel> _notasRecentes = [];

  HomePageController() {
    isLoadingFunc();
  }

  changeUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  changeIsLoading(bool value) {
    _isLoading = value;
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
