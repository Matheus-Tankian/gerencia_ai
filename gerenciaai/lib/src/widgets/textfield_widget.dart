import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.bordeSize,
    this.contentPadding,
    this.fillColor,
    this.prefixIcon,
  });

  final String? hintText;
  final double? bordeSize;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText ?? 'Pesquisar',
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(bordeSize ?? 15.0),
        ),
        filled: true,
        fillColor: fillColor ?? const Color(0xffE3E3E5),
        prefixIcon: prefixIcon ?? const Icon(Icons.search),
      ),
    );
  }
}
