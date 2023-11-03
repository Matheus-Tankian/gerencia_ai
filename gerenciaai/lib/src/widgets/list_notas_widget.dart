import 'package:flutter/material.dart';
import 'package:gerenciaai/src/home/models/nota_model.dart';

import 'package:gerenciaai/src/home/notas_page/notas_controller.dart';
import 'package:gerenciaai/src/widgets/card_notas_widget.dart';
import 'package:gerenciaai/src/widgets/page_nota.dart';

class ListNotassWidget extends StatefulWidget {
  const ListNotassWidget({
    super.key,
    required this.controller,
  });

  final NotasController controller;

  @override
  State<ListNotassWidget> createState() => _ListNotassWidgetState();
}

class _ListNotassWidgetState extends State<ListNotassWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotaModel>>(
      stream: widget.controller.consultarNotas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('Nenhum dado encontrado.');
        } else {
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              final notas = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 8,
                  right: 8,
                ),
                child: CardNotaWidget(
                  title: notas![index].notaName,
                  data: notas[index].notaData,
                  value:
                      double.parse(notas[index].notaPrice).toStringAsFixed(2),
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageNota(
                          id: index,
                          nome: notas[index].notaName,
                          data: notas[index].notaData,
                          descricao: notas[index].notaDescription,
                          valor: double.parse(notas[index].notaPrice),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
