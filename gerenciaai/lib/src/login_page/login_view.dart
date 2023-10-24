import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/src/app/routes/routes.dart';
import 'package:gerenciaai/src/login_page/login_controller.dart';
import 'package:gerenciaai/src/widgets/inputText_widget.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
      child: Consumer<LoginController>(
        builder: (_, provider, __) => SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  color: const Color(0xffF9A826),
                  width: double.infinity,
                  height: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      top: 70,
                    ),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                            'E-mail',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          TextField(
                            controller: provider.email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Insira seu email',
                              hintStyle: const TextStyle(
                                color: Color(0xffADADAD),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: provider.emailHasError == true
                                      ? Colors.red
                                      : const Color(0xffF9A826),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: provider.emailHasError,
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                Visibility(
                                  visible: provider.email.text.isNotEmpty,
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
                            visible: !provider.emailHasError,
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
                            controller: provider.senha,
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
                                  color: provider.senhaHasError == true
                                      ? Colors.red
                                      : const Color(0xffF9A826),
                                ),
                              ),
                            ),
                            obscureText: provider.isObscureText,
                          ),
                          Visibility(
                            visible: provider.senhaHasError,
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                Visibility(
                                  visible: provider.senha.text.isNotEmpty,
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
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (newValue) {},
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'Continuar loggado?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                ],
                              ),

                              // const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff707070),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 38),
                          InkWell(
                            onTap: () async {
                              log('loggin');

                              await provider.checkLogin();

                              if (provider.canLogin == true) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Routes.homePage, (route) => false);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffF9A826),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: const Offset(
                                        4, 8), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 50,
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.createAccountPage);
                              },
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Não tem uma conta? Registre-se ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'aqui!',
                                      style: TextStyle(
                                        color: Color(0xffF9A826),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
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
