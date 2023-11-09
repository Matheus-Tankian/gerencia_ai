import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  const InputTextWidget({
    super.key,
    required this.textController,
    required this.borderColor,
    required this.hintText,
    required this.hasError,
    required this.textIsNotEmpty,
    required this.textVazio,
    required this.textInvalido,
    this.isObscure,
    this.textInputType,
    this.suffixIcon,
  });

  final TextEditingController textController;
  final bool borderColor;
  final String hintText;
  final bool hasError;
  final bool textIsNotEmpty;
  final String textVazio;
  final String textInvalido;
  final bool? isObscure;
  final TextInputType? textInputType;
  final Widget? suffixIcon;

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.textController,
          keyboardType: widget.textInputType ?? TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Color(0xffADADAD),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor == true
                    ? Colors.red
                    : const Color(0xffF9A826),
              ),
            ),
          ),
          obscureText: widget.isObscure ?? false,
        ),
        Visibility(
          visible: widget.hasError,
          child: Column(
            children: [
              const SizedBox(height: 8),
              Visibility(
                visible: widget.textIsNotEmpty,
                replacement: Text(
                  widget.textVazio,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                child: Text(
                  widget.textInvalido,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
