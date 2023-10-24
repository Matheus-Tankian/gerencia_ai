import 'package:flutter/material.dart';
import 'package:gerenciaai/src/widgets/card_notas_widget.dart';
import 'package:gerenciaai/src/widgets/page_nota.dart';
import 'package:gerenciaai/src/widgets/textfield_widget.dart';

class NotasPage extends StatelessWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 0,
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Notas Fiscais',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TextFieldWidget(),
            const SizedBox(height: 6),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
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
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageNota(
                              id: index,
                              nome: 'nome',
                              data: '1$index oct 2022',
                              descricao: 'descriçao',
                              valor: 200,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
