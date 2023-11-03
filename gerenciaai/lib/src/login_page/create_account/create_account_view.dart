import 'package:flutter/material.dart';
import 'package:gerenciaai/src/login_page/create_account/create_account_controller.dart';
import 'package:provider/provider.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateAccountController(),
      child: Consumer<CreateAccountController>(
        builder: (_, provider, __) => SafeArea(
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.transparent,
                      height: 1,
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                        top: 70,
                      ),
                      child: Text(
                        'Cadastre-se ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 44,
                          horizontal: 28,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // Alinhe os elementos ao centro
                          children: [
                            const Text(
                              'Nome',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextField(
                              controller: provider.newNome,
                              decoration: InputDecoration(
                                hintText: 'Insira seu nome',
                                hintStyle: const TextStyle(
                                  color: Color(0xffADADAD),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: provider.newNomeHasError == true
                                        ? Colors.red
                                        : const Color(0xffF9A826),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: provider.newNomeHasError,
                              child: Column(
                                children: [
                                  const SizedBox(height: 8),
                                  Visibility(
                                    visible: provider.newNome.text.isNotEmpty,
                                    replacement: const Text(
                                      'Nome vazio',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    //'E-mail invalido',
                                    child: const Text(
                                      'Nome invalido',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !provider.newNomeHasError,
                              child: const SizedBox(height: 16),
                            ),
                            const Text(
                              'E-mail',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextField(
                              controller: provider.newEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Insira seu e-mail',
                                hintStyle: const TextStyle(
                                  color: Color(0xffADADAD),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: provider.newEmailHasError == true
                                        ? Colors.red
                                        : const Color(0xffF9A826),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: provider.newEmailHasError,
                              child: Column(
                                children: [
                                  const SizedBox(height: 8),
                                  Visibility(
                                    visible: provider.newEmail.text.isNotEmpty,
                                    replacement: const Text(
                                      'E-mail vazio',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    child: const Text(
                                      'E-mail invalido',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !provider.newEmailHasError,
                              child: const SizedBox(height: 16),
                            ),
                            const Text(
                              'Senha',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextField(
                              controller: provider.newSenha,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    color: const Color(0xffF9A826),
                                    !provider.isObscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    provider.changeIsObscureText();
                                  },
                                ),
                                hintText: 'Insira sua Senha',
                                hintStyle: const TextStyle(
                                  color: Color(0xffADADAD),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: provider.newSenhaHasError == true
                                        ? Colors.red
                                        : const Color(0xffF9A826),
                                  ),
                                ),
                              ),
                              obscureText: provider.isObscureText,
                            ),
                            Visibility(
                              visible: provider.newSenhaHasError,
                              child: Column(
                                children: [
                                  const SizedBox(height: 8),
                                  Visibility(
                                    visible: provider.newSenha.text.isNotEmpty,
                                    replacement: const Text(
                                      'Senha vazia',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    child: const Text(
                                      'Senha invalida',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Confirme sua senha',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextField(
                              controller: provider.confirmSenha,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  color: const Color(0xffF9A826),
                                  icon: Icon(!provider.isObscureTextConfirmSenha
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    provider
                                        .changeIsObscureTextConfirmSenhaHasError();
                                  },
                                ),
                                hintText: 'Insira sua senha novamente',
                                hintStyle: const TextStyle(
                                  color: Color(0xffADADAD),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: provider.confirmSenhaHasError == true
                                        ? Colors.red
                                        : const Color(0xffF9A826),
                                  ),
                                ),
                              ),
                              obscureText: provider.isObscureTextConfirmSenha,
                            ),
                            Visibility(
                              visible: provider.confirmSenhaHasError,
                              child: Column(
                                children: [
                                  const SizedBox(height: 8),
                                  Visibility(
                                    visible:
                                        provider.confirmSenha.text.isNotEmpty,
                                    replacement: const Text(
                                      'Senha vazia',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    child: const Text(
                                      'Senha invalida',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 38),
                            InkWell(
                              onTap: () async {
                                await provider.checkNewAccont(context);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffF9A826),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    'Salvar',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
