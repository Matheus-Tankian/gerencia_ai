import 'package:flutter/material.dart';
import 'package:gerenciaai/services/get_notas_fiscasi_servicies.dart';

class AddController extends ChangeNotifier {
  final GetNotasFiscaisServicies _getNotasFiscaisServicies =
      GetNotasFiscaisServicies();

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

    if (dateWork.text.isEmpty && dateWork.text.trim().length != 10) {
      changeDateWorkIsValid(false);
    } else if (dateWork.text.trim().length == 10) {
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
  }

  Future<void> checkSave(BuildContext context, String link) async {
    await checkValidate();
    _getNotasFiscaisServicies.consultarNotas();
    changeFileIsValid(true);
    if ((_nameInvoiceIsValid &&
                _dateWorkIsValid &&
                _invoiceAmountIsValid &&
                _descriptionIsValid) ==
            true &&
        link != '') {
      String getAddNotas = await _getNotasFiscaisServicies.addNotasToken(
        data: dateWork.text.trim(),
        descricao: description.text,
        nomeNota: nameInvoice.text,
        valor: invoiceAmount.text,
        linkPdf: link,
      );
      if (getAddNotas == 'sucesso') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Adicionado com sucesso!'),
          ),
        );
        nameInvoice.clear();
        dateWork.clear();
        invoiceAmount.clear();
        description.clear();
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(getAddNotas),
          ),
        );
      }
    } else if (link == '') {
      changeFileIsValid(false);
    }
  }
}
