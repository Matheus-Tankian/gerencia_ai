import 'package:flutter/material.dart';

class CardNotaWidget extends StatelessWidget {
  const CardNotaWidget(
      {super.key,
      this.width,
      this.height,
      this.cardDecoration,
      this.cardPadding,
      this.titleCard,
      this.mainText,
      this.dataText});

  final double? width;
  final double? height;
  final BoxDecoration? cardDecoration;
  final EdgeInsets? cardPadding;
  final List<Widget>? titleCard;
  final Text? mainText;
  final Text? dataText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 170,
      height: height ?? 210,
      decoration: cardDecoration ??
          const BoxDecoration(
            color: Color(0xffd08600),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
      child: Padding(
        padding: cardPadding ??
            const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 22,
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: titleCard ??
                  [
                    const Icon(
                      Icons.build_outlined,
                      size: 20,
                      color: Color(0xfffff0dc),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Projeto 1',
                      style: TextStyle(
                        color: Color(0xfffff0dc),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
            ),
            mainText ??
                const Text(
                  'Front End Development',
                  style: TextStyle(
                    color: Color(0xfffff0dc),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            dataText ??
                const Text(
                  'Setembro 2023',
                  style: TextStyle(
                    color: Color(0xfffff0dc),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
