import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/src/widgets/card_notas_widget.dart';
import 'package:gerenciaai/src/widgets/chart_widget.dart';
import 'package:gerenciaai/src/widgets/textfield_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Olá ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Vitor',
                        style: TextStyle(
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
                const SizedBox(height: 20),
                const TextFieldWidget(),
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
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          log('item: $index');
                        },
                        child: const CardNotaWidget(),
                      ),
                    );
                  },
                ),
              ),
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
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: Color(0xffffc041),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
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
                    //==========

                    InkWell(
                      onTap: () {
                        log('anual');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: Color(0xffffc041),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
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
                const SizedBox(height: 16),
                const Text(
                  'Graficos anual',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                const SizedBox(
                  height: 200,
                  child: BarChartWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//grafico



