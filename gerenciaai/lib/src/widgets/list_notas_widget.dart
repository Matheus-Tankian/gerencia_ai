import 'package:flutter/material.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.searchNotas('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.controller.filteredNotas.isNotEmpty,
      replacement: const Center(
        child: Text(
          'Vazio',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: GridView.builder(
        itemCount: widget.controller.filteredNotas.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          final filteredNotas = widget.controller.filteredNotas;
          return Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 8,
              right: 8,
            ),
            child: CardNotaWidget(
              title: filteredNotas[index].notaName,
              data: filteredNotas[index].notaData,
              value: filteredNotas[index].notaPrice,
              tap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageNota(
                      id: index,
                      nome: filteredNotas[index].notaName,
                      data: filteredNotas[index].notaData,
                      descricao: filteredNotas[index].notaDescription,
                      valor: filteredNotas[index].notaPrice,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
