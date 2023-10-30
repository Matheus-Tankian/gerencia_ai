import 'dart:developer';

import 'package:flutter/material.dart';

class AddController extends ChangeNotifier {
  TextEditingController nameInvoice = TextEditingController();

  TextEditingController dateWork = TextEditingController();

  TextEditingController invoiceAmount = TextEditingController();

  TextEditingController description = TextEditingController();

  final String _file = '';
  String get file => _file;

  bool _nameInvoiceIsValid = true;
  bool get nameInvoiceIsValid => _nameInvoiceIsValid;

  bool _dateWorkIsValid = true;
  bool get dateWorkIsValid => _dateWorkIsValid;

  bool _invoiceAmountIsValid = true;
  bool get invoiceAmountIsValid => _invoiceAmountIsValid;

  bool _descriptionIsValid = true;
  bool get descriptionIsValid => _descriptionIsValid;

  bool _fileIsValid = true;
  bool get fileIsValid => _fileIsValid;

  changeNameInvoiceIsValid(bool value) {
    _nameInvoiceIsValid = value;
    notifyListeners();
  }

  changeDateWorkIsValid(bool value) {
    _dateWorkIsValid = value;
    notifyListeners();
  }

  changeInvoiceAmountIsValid(bool value) {
    _invoiceAmountIsValid = value;
    notifyListeners();
  }

  changeDescriptionIsValid(bool value) {
    _descriptionIsValid = value;
    notifyListeners();
  }

  changeFileIsValid(bool value) {
    _fileIsValid = value;
    notifyListeners();
  }

  Future<void> checkValidate() async {
    if (nameInvoice.text.isEmpty) {
      changeNameInvoiceIsValid(false);
    } else {
      changeNameInvoiceIsValid(true);
    }

    if (dateWork.text.isEmpty) {
      changeDateWorkIsValid(false);
    } else {
      changeDateWorkIsValid(true);
    }

    if (invoiceAmount.text.isEmpty) {
      changeInvoiceAmountIsValid(false);
    } else {
      changeInvoiceAmountIsValid(true);
    }

    if (description.text.isEmpty) {
      changeDescriptionIsValid(false);
    } else {
      changeDescriptionIsValid(true);
    }

    // if (file.isEmpty || file == '') {
    //   changeFileIsValid(false);
    // } else {
    //   changeFileIsValid(true);
    // }
  }

  Future<void> checkSave() async {
    await checkValidate();
    // eu nao add o fileIsValid
    if ((_nameInvoiceIsValid &&
            _dateWorkIsValid &&
            _invoiceAmountIsValid &&
            _descriptionIsValid) ==
        true) {
      log('E valido');
    } else {
      log('Nao e valido');
    }
  }
}
