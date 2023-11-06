import 'package:flutter/material.dart';
import 'package:gerenciaai/src/home/notas_page/notas_controller.dart';
import 'package:gerenciaai/src/widgets/list_notas_widget.dart';
import 'package:gerenciaai/src/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class NotasPage extends StatelessWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotasController>(
      create: (_) => NotasController(),
      child: Consumer<NotasController>(
        builder: (_, provider, __) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 0,
            ),
            child: Visibility(
              visible: !provider.isLoading,
              replacement: const Center(
                child: CircularProgressIndicator(),
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
                  TextFieldWidget(
                    textController: provider.search,
                    onChanged: (value) {
                      provider.searchNotas(value);
                    },
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: ListNotassWidget(
                      controller: provider,
                    ),
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
