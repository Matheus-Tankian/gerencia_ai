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
    List<NotaModel> notas = widget
        .controller.filteredNotas; // Obtenha as notas diretamente do controller

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
          ))
        : GridView.builder(
            itemCount: notas.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 8,
                  right: 8,
                ),
                child: CardNotaWidget(
                  title: notas[index].notaName,
                  data: notas[index].notaData,
                  value:
                      double.parse(notas[index].notaPrice).toStringAsFixed(2),
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageNota(
                          id: index,
                          link: notas[index].linkPdf,
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
}
