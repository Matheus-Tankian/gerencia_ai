import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onTap,
    this.decoration,
    this.height,
    this.title,
    this.titleStyle,
  });

  final Function()? onTap;
  final BoxDecoration? decoration;
  final double? height;
  final String? title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        decoration: decoration ??
            const BoxDecoration(
              color: Color(0xffF9A826),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
        height: height ?? 50,
        child: Center(
          child: Text(
            title ?? 'Login',
            style: titleStyle ??
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
