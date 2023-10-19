import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/src/widgets/button_widget.dart';
import 'package:gerenciaai/src/widgets/textfield_widget.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          children: [
            const Text(
              'Preencha os dados da nota fiscal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const TextFieldWidget(
              hintText: 'Nome da nota fiscal',
              prefixIcon: Icon(
                Icons.assignment_outlined,
              ),
            ),
            const SizedBox(height: 16),
            const TextFieldWidget(
              hintText: 'Data do serviço',
              prefixIcon: Icon(
                Icons.calendar_today_outlined,
              ),
            ),
            const SizedBox(height: 16),
            const TextFieldWidget(
              hintText: 'Valor',
              prefixIcon: Icon(
                Icons.wallet_sharp,
              ),
            ),
            const SizedBox(height: 16),
            const TextFieldWidget(
              hintText: 'Descrição',
              prefixIcon: Icon(
                Icons.description_outlined,
              ),
            ),
            const Spacer(),
            ButtonWidget(
              title: 'Salvar',
              onTap: () {
                log('salvou');
              },
            ),
          ],
        ),
      ),
    );
  }
}
