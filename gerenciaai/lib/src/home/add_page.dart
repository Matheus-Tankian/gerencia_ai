import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/src/widgets/button_widget.dart';
import 'package:gerenciaai/src/widgets/textfield_widget.dart';
import 'package:file_picker/file_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

String filePath = '';

class _AddPageState extends State<AddPage> {
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
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff0f0f0),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );

                          if (result != null) {
                            PlatformFile file = result.files.first;
                            filePath = file.path ?? '';
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xffefefef),
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        child: SizedBox(
                          width: 140,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Escolher arquivo',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      filePath != '' ? filePath : 'Nenhum arquivo escolhido',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
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
