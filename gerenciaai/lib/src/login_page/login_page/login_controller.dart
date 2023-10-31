import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/services/authentication_service.dart';
import 'package:gerenciaai/src/app/routes/routes.dart';

class LoginController extends ChangeNotifier {
  final AuthenticationService _authenticationLogin = AuthenticationService();

  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  bool _isObscureText = true;
  bool get isObscureText => _isObscureText;

  bool _canLogin = false;
  bool get canLogin => _canLogin;

  bool _emailHasError = false;
  bool get emailHasError => _emailHasError;

  bool _senhaHasError = false;
  bool get senhaHasError => _senhaHasError;

  String _loginMenssager = '';
  String get loginMenssager => _loginMenssager;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  changeIsObscureText() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  Future<void> changeIsLoading() async {
    Future.delayed(const Duration(seconds: 2));
    _isLoading = true;
    notifyListeners();
  }

  changeCanLogin(bool value, String text) {
    _canLogin = value;
    if (value == false) {
      _loginMenssager = text;
    }
    notifyListeners();
  }

  changeEmailHasError(bool value) {
    _emailHasError = value;
    notifyListeners();
  }

  changeSenhaHasError(bool value) {
    _senhaHasError = value;
    notifyListeners();
  }

  Future<void> checkLogin(BuildContext context) async {
    if (email.text.isEmpty ||
        email.text.length <= 3 ||
        !email.text.contains('@')) {
      changeEmailHasError(true);
    } else {
      changeEmailHasError(false);
    }

    if (senha.text.isEmpty) {
      changeSenhaHasError(true);
    } else {
      changeSenhaHasError(false);
    }

    if (emailHasError == false && senhaHasError == false) {
      _authenticationLogin
          .userLogin(email: email.text, senha: senha.text)
          .then((String? erro) {
        changeIsLoading();
        notifyListeners();
        if (erro != null) {
          changeCanLogin(false, erro);
          log('erro: $erro');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(erro),
            ),
          );
        } else {
          changeCanLogin(true, '');
          log('Login');
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homePage, (route) => false);
        }
      });
    }
  }
}
