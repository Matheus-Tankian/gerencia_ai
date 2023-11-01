import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciaai/services/authentication_service.dart';

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

  String _errorMenssager = '';
  String get errorMenssager => _errorMenssager;

  changeNewNomeHasError(bool value) {
    _newNomeHasError = value;
    notifyListeners();
  }

  changeNewEmailHasError(bool value) {
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

  chageHasChecked(bool value, String erro) {
    _hasChecked = value;
    if (value == false) {
      _errorMenssager = erro;
    }
    notifyListeners();
  }

  Future<void> checkNewAccont(BuildContext context) async {
    if (newNome.text.isEmpty || newNome.text.length <= 1) {
      changeNewNomeHasError(true);
    } else {
      changeNewNomeHasError(false);
    }

    if (newEmial.text.isEmpty || !newEmial.text.contains('@')) {
      changeNewEmailHasError(true);
    } else {
      changeNewEmailHasError(false);
    }

    if (newSenha.text.isEmpty || newSenha.text.length <= 3) {
      changeNewSenhaHasError(true);
    } else {
      changeNewSenhaHasError(false);
    }

    if (confirmSenha.text.isEmpty || confirmSenha.text.length <= 3) {
      changeConfirmSenhaHasError(true);
    } else {
      changeConfirmSenhaHasError(false);
    }

    if (newNomeHasError == false &&
        newEmailHasError == false &&
        newSenhaHasError == false &&
        confirmSenhaHasError == false &&
        (newSenha.text == confirmSenha.text)) {
      AuthenticationService authenticationService = AuthenticationService();

      authenticationService
          .cadastrarUsuario(
        nome: newNome.text,
        email: newEmial.text,
        senha: newSenha.text,
      )
          .then(
        (String? erro) {
          if (erro != null) {
            chageHasChecked(false, erro);
            log('erro: $erro');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(erro),
              ),
            );
          } else {
            chageHasChecked(true, '');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Cadastro realizado com sucesso'),
              ),
            );
            Navigator.pop(context);
            log('snackbar foi cad');
          }
        },
      );
    } else {
      chageHasChecked(false, '');
    }
  }
}
