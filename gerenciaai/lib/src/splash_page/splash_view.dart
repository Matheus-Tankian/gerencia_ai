import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/services/get_storage.dart';
import 'package:gerenciaai/src/app/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final BoxStorage _boxStorage = BoxStorage();
  @override
  void initState() {
    super.initState();
    var aux = _boxStorage.userEmail.read('email');
    Future.delayed(const Duration(seconds: 2), () {
      if (_boxStorage.userLogged.read('logged').toString().trim() != 'false' &&
          aux != null &&
          1 == 3) {
        Navigator.of(context).pushReplacementNamed(Routes.homePage);
        log('aaa');
      } else {
        _boxStorage.userEmail.remove('email');
        _boxStorage.userLogged.remove('logged');
        log('bbb');
        Navigator.of(context).pushReplacementNamed(Routes.loginPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Gerencia ',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0XFFFF941A),
              ),
              children: [
                TextSpan(
                  text: 'AÍ',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF706E7A),
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
