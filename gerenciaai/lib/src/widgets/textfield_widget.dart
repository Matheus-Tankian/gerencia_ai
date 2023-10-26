import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.bordeSize,
    this.contentPadding,
    this.fillColor,
    this.prefixIcon,
    required this.textController,
    this.onChanged,
  });

  final String? hintText;
  final double? bordeSize;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final Icon? prefixIcon;
  final TextEditingController textController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText ?? 'Pesquisar',
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(bordeSize ?? 15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(bordeSize ?? 15.0)),
          borderSide: const BorderSide(
            color: Color(0xffff4700),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(bordeSize ?? 15.0)),
          borderSide: const BorderSide(
            color: Color(0xffff4700),
          ),
        ),
        filled: true,
        fillColor: fillColor ?? Colors.white,
        prefixIcon: prefixIcon ?? const Icon(Icons.search),
      ),
    );
  }
}
