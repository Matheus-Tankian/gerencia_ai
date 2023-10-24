import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
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

  changeIsObscureText() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  changeCanLogin(bool value) {
    _canLogin = value;
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

  Future<void> checkLogin() async {
    if (email.text.isEmpty ||
        email.text.length <= 3 ||
        !email.text.contains('@')) {
      changeEmailHasError(true);
    } else {
      changeEmailHasError(false);
    }

    if (senha.text.isEmpty || senha.text.length <= 3) {
      changeSenhaHasError(true);
    } else {
      changeSenhaHasError(false);
    }

    if (emailHasError == false && senhaHasError == false) {
      changeCanLogin(true);
    } else {
      changeCanLogin(false);
    }
  }
}
