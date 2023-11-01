import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({
    super.key,
    required this.text,
    this.isError = false,
  });

  final String text;
  final bool? isError;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: isError == false ? Colors.red : Colors.green,
      content: Text(text),
    );
  }
}
