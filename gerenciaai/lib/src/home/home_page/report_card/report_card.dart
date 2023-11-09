import 'package:flutter/material.dart';
import 'package:gerenciaai/src/home/home_page/report_card/report_card_controller.dart';
import 'package:gerenciaai/src/home/models/nota_model.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class ReportCard extends StatefulWidget {
  final String title;

  const ReportCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReportController>(
      create: (_) => ReportController(),
      child: Consumer<ReportController>(
        builder: (_, provider, __) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Relatorio ${widget.title}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: const Color(0xfff9a826),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Visibility(
                visible: !provider.isLoading,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.title == 'Anual',
                      replacement: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Informe:',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: TextField(
                              controller: provider.mesController,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                hintText: 'Mês',
                                hintStyle: TextStyle(
                                  color: Color(0xffADADAD),
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Color(0xffF9A826),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: false == false
                                        ? Colors.red
                                        : Color(0xffF9A826),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: TextField(
                              keyboardType: TextInputType.datetime,
                              controller: provider.anoMesController,
                              decoration: const InputDecoration(
                                hintText: 'Ano',
                                hintStyle: TextStyle(
                                  color: Color(0xffADADAD),
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Color(0xffF9A826),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: false == false
                                        ? Colors.red
                                        : Color(0xffF9A826),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              if (provider.anoMesController.text.isNotEmpty &&
                                  provider.mesController.text.isNotEmpty) {
                                provider.searchNotas(
                                    '${provider.mesController.text}/${provider.anoMesController.text}');
                              } else {
                                provider.searchNotas('');
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xfff9a826),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Informe o Ano',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 40,
                            width: 180,
                            child: TextField(
                              controller: provider.anoController,

                              //ano ano

                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                hintText: 'Ano',
                                hintStyle: TextStyle(
                                  color: Color(0xffADADAD),
                                ),
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Color(0xffF9A826),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: false == false
                                        ? Colors.red
                                        : Color(0xffF9A826),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              provider.searchNotas(provider.anoController.text);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xfff9a826),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Gerencia ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFFF941A),
                            ),
                            children: [
                              TextSpan(
                                text: 'AÍ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF706E7A),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(DateFormat('dd/MM/yyyy').format(DateTime.now()))
                      ],
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'Relatorio ${widget.title}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Visibility(
                        visible: provider.filteredNotas.isNotEmpty,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nome',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            Text(
                              'Data',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            Text(
                              'Valor',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Divider(
                      height: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 4),
                    //
                    Visibility(
                      visible: provider.filteredNotas.isNotEmpty,
                      replacement: Center(
                        child: Text(
                          provider.anoController.text.isEmpty
                              ? 'Informe o ${widget.title == 'Anual' ? 'Ano' : 'Mês e o Ano'} '
                              : 'Não existe notas nesse ${widget.title == 'Anual' ? 'Ano' : 'Mês'} ',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: Tabela(
                        controller: provider,
                      ),
                    ),
                    Visibility(
                      visible: provider.filteredNotas.isNotEmpty,
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quantidade: ${provider.filteredNotas.length}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            Text(
                              'Valor: ${provider.total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Tabela extends StatefulWidget {
  const Tabela({
    super.key,
    required this.controller,
  });

  final ReportController controller;

  @override
  State<Tabela> createState() => _TabelaState();
}

class _TabelaState extends State<Tabela> {
  @override
  Widget build(BuildContext context) {
    List<NotaModel> notas = widget.controller.filteredNotas;
    return notas.isEmpty
        ? const Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Nenhum item encontrado.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: notas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 6,
                    ),
                    color: index % 2 == 0
                        ? const Color.fromARGB(255, 167, 166, 166)
                        : Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notas[index].notaName.length <= 7
                              ? notas[index].notaName
                              : '${notas[index].notaName.substring(0, 7)}..',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          notas[index].notaData,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          double.parse(notas[index].notaPrice)
                              .toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
