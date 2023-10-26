import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/src/home/home_page/home_page_controller.dart';
import 'package:gerenciaai/src/widgets/card_notas_widget.dart';
import 'package:gerenciaai/src/widgets/chart_widget.dart';
import 'package:gerenciaai/src/widgets/page_nota.dart';
import 'package:gerenciaai/src/widgets/report_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageController(),
      child: Consumer<HomePageController>(
        builder: (_, provider, __) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Olá ',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: provider.userName,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF9A826),
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      'Tenha um bom dia!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Serviços recentes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: provider.notasRecentes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        bottom: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          log('item: $index');
                        },
                        child: CardNotaWidget(
                          title: provider.notasRecentes[index].notaName,
                          data: provider.notasRecentes[index].notaData,
                          value: provider.notasRecentes[index].notaPrice,
                          height: 180,
                          tap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageNota(
                                  id: index,
                                  nome: provider.notasRecentes[index].notaName,
                                  data: provider.notasRecentes[index].notaData,
                                  descricao: provider
                                      .notasRecentes[index].notaDescription,
                                  valor:
                                      provider.notasRecentes[index].notaPrice,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gerar relatorio',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            log('mensal');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReportCard(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffc041),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(
                                        4,
                                        8,
                                      ),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.assignment_outlined,
                                    size: 34,
                                    color: Color(0xff4f3716),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'Relatorio Mensal',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            log('anual');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReportCard(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffc041),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(
                                        4,
                                        8,
                                      ),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.assignment_outlined,
                                    size: 34,
                                    color: Color(0xff4f3716),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'Relatorio anual',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    const Text(
                      'Graficos anual',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 52),
                    const SizedBox(
                      height: 200,
                      child: BarChartWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
