import 'dart:developer';

import 'package:flutter/material.dart';

class CreateAccountController extends ChangeNotifier {
  TextEditingController newNome = TextEditingController();
  TextEditingController newEmial = TextEditingController();
  TextEditingController newSenha = TextEditingController();
  TextEditingController confirmSenha = TextEditingController();

  final bool _isValidNewNome = false;
  bool get isValidNewNome => _isValidNewNome;

  final bool _isValidNewEmial = false;
  bool get isValidNewEmial => _isValidNewEmial;

  final bool _isValidNewSenha = false;
  bool get isValidNewSenha => _isValidNewSenha;

  final bool _isValidConfirmSenha = false;
  bool get isValidConfirmSenha => _isValidConfirmSenha;

  bool _newNomeHasError = false;
  bool get newNomeHasError => _newNomeHasError;

  bool _newEmailHasError = false;
  bool get newEmailHasError => _newEmailHasError;

  bool _newSenhaHasError = false;
  bool get newSenhaHasError => _newSenhaHasError;

  bool _confirmSenhaHasError = false;
  bool get confirmSenhaHasError => _confirmSenhaHasError;

  bool _hasChecked = false;
  bool get hasChecked => _hasChecked;

  bool _isObscureText = true;
  bool get isObscureText => _isObscureText;

  bool _isObscureTextConfirmSenha = true;
  bool get isObscureTextConfirmSenha => _isObscureTextConfirmSenha;

  changeNewNome() {}

  changeNewEmial() {}

  changeNewSenha() {}

  changeConfirmSenha() {}

  changeNewNomeHasError(bool value) {
    _newNomeHasError = value;
    notifyListeners();
  }

  changeNewSechaHasError(bool value) {
    _newEmailHasError = value;
    notifyListeners();
  }

  changeNewSenhaHasError(bool value) {
    _newSenhaHasError = value;
    notifyListeners();
  }

  changeConfirmSenhaHasError(bool value) {
    _confirmSenhaHasError = value;
    notifyListeners();
  }

  changeIsObscureTextConfirmSenhaHasError() {
    _isObscureTextConfirmSenha = !_isObscureTextConfirmSenha;
    notifyListeners();
  }

  changeIsObscureText() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  chageHasChecked(bool value) {
    _hasChecked = value;
    notifyListeners();
  }

  Future<void> checkNewAccont() async {
    if (newNome.text.isEmpty || newNome.text.length <= 1) {
      log('Nome  nao e valido');
      changeNewNomeHasError(true);
    } else {
      log('valido nome');
      changeNewNomeHasError(false);
    }

    if (newEmial.text.isEmpty || newEmial.text.contains('@')) {
      log('newEmial NAO  e valido');
      changeNewSechaHasError(true);
    } else {
      log('email e valido ');
      changeNewSechaHasError(false);
    }

    if (newSenha.text.isEmpty || newSenha.text.length <= 3) {
      log('newSenha NAO eh valido');
      changeNewSenhaHasError(true);
    } else {
      log('newSenha eh valido ');
      changeNewSenhaHasError(false);
    }

    if (confirmSenha.text.isEmpty || confirmSenha.text.length <= 3) {
      log('confirmSenha NAO eh valido');
      changeConfirmSenhaHasError(true);
    } else {
      log('confirmSenha eh valido');
      changeConfirmSenhaHasError(false);
    }

    if (_isValidNewNome &&
        _isValidNewEmial &&
        _isValidNewSenha &&
        _isValidConfirmSenha) {
      chageHasChecked(true);
      log('check passou');
    } else {
      chageHasChecked(false);
      log('check NAO passou');
    }
  }
}
