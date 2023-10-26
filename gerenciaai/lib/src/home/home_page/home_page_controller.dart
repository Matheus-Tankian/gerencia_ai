import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {
  final String _userName = 'Vitor';
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
