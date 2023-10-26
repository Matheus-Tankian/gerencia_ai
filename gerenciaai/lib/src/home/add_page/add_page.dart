import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gerenciaai/src/widgets/button_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String filePath = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Nome da nota fiscal',
                  hintStyle: TextStyle(
                    color: Color(0xffADADAD),
                  ),
                  prefixIcon: Icon(
                    Icons.assignment_outlined,
                    color: Color(0xffF9A826),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          // provider.emailHasError == true
                          //  ? Colors.red
                          //:
                          Color(0xffF9A826),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Data do serviço',
                  hintStyle: TextStyle(
                    color: Color(0xffADADAD),
                  ),
                  prefixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xffF9A826),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          // provider.emailHasError == true
                          //  ? Colors.red
                          //:
                          Color(0xffF9A826),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Valor',
                  hintStyle: TextStyle(
                    color: Color(0xffADADAD),
                  ),
                  prefixIcon: Icon(
                    Icons.wallet_sharp,
                    color: Color(0xffF9A826),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          // provider.emailHasError == true
                          //  ? Colors.red
                          //:
                          Color(0xffF9A826),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Descrição',
                  hintStyle: TextStyle(
                    color: Color(0xffADADAD),
                  ),
                  prefixIcon: Icon(
                    Icons.description_outlined,
                    color: Color(0xffF9A826),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          // provider.emailHasError == true
                          //  ? Colors.red
                          //:
                          Color(0xffF9A826),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xffADADAD),
                      width: 1,
                    ),
                  ),
                ),
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(
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
                        child: const SizedBox(
                          width: 140,
                          height: double.infinity,
                          child: Center(
                            child: Text(
                              'Escolher arquivo',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        filePath != '' ? filePath : 'Nenhum arquivo escolhido',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xffADADAD),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                title: 'Salvar',
                onTap: () {
                  log('salvou');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
