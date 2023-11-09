import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/services/get_notas_fiscasi_servicies.dart';
import 'package:gerenciaai/src/widgets/pdf_widget.dart';

class PageNota extends StatelessWidget {
  const PageNota({
    super.key,
    this.nome,
    this.data,
    this.valor,
    this.descricao,
    this.id,
    this.link,
  });

  final String? nome;
  final String? data;
  final double? valor;
  final String? descricao;
  final String? id;
  final String? link;

  @override
  Widget build(BuildContext context) {
    GetNotasFiscaisServicies getNotasFiscaisServicies =
        GetNotasFiscaisServicies();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              color: const Color(0xffF9A826),
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 34,
              left: -2,
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Color(0xffFFB133),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            Positioned(
              top: -80,
              left: 240,
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  color: Color(0xffFFB133),
                  borderRadius: BorderRadius.all(Radius.circular(125)),
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: 30,
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Color(0xffFFB133),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        log('card aq');
                        log('id no card: $id');
                        getNotasFiscaisServicies.excluirNota(id!);
                        Future.delayed(const Duration(milliseconds: 500));
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        nome!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 44,
                    horizontal: 28,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Valor',
                        style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 55),
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'R\$ ${valor!.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Divider(
                        color: Color(0XFFBFC8E8),
                        height: 1,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Descrição',
                        style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 55),
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          descricao!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Divider(
                        color: Color(0XFFBFC8E8),
                        height: 1,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Arquivo',
                        style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 55),
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfWidget(pdf: link!),
                            ),
                          );
                        },
                        child: Container(
                          height: 260,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFf5f5f5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.picture_as_pdf_rounded,
                                size: 100,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Toque aqui para acessar o PDF',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
