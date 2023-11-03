import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gerenciaai/src/home/add_page/add_controller.dart';
import 'package:gerenciaai/src/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String filePath = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddController>(
      create: (_) => AddController(),
      child: Consumer<AddController>(
        builder: (_, provider, __) => SafeArea(
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
                  TextField(
                    controller: provider.nameInvoice,
                    decoration: InputDecoration(
                      hintText: 'Nome da nota fiscal',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      prefixIcon: const Icon(
                        Icons.assignment_outlined,
                        color: Color(0xffF9A826),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.nameInvoiceIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.nameInvoiceIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    controller: provider.dateWork,
                    decoration: InputDecoration(
                      hintText: 'Data do serviço',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      prefixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xffF9A826),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.dateWorkIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.dateWorkIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    controller: provider.invoiceAmount,
                    decoration: InputDecoration(
                      hintText: 'Valor',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      prefixIcon: const Icon(
                        Icons.wallet_sharp,
                        color: Color(0xffF9A826),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.invoiceAmountIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.invoiceAmountIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
                  TextField(
                    controller: provider.description,
                    decoration: InputDecoration(
                      hintText: 'Descrição',
                      hintStyle: const TextStyle(
                        color: Color(0xffADADAD),
                      ),
                      prefixIcon: const Icon(
                        Icons.description_outlined,
                        color: Color(0xffF9A826),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: provider.descriptionIsValid == false
                              ? Colors.red
                              : const Color(0xffF9A826),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: provider.descriptionIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    child: const SizedBox(height: 16),
                  ),
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
                                side: const BorderSide(
                                    color: Colors.black, width: 1),
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
                            filePath != ''
                                ? filePath
                                : 'Nenhum arquivo escolhido',
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
                  Visibility(
                    visible: provider.fileIsValid == true,
                    replacement: const Column(
                      children: [
                        SizedBox(height: 16),
                        Text(
                          '\tCampo Invalido',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                    child: const SizedBox(height: 32),
                  ),
                  ButtonWidget(
                    title: 'Salvar',
                    onTap: () async {
                      await provider.checkSave(context);
                      log('salvou');
                      // ignore: use_build_context_synchronously
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
