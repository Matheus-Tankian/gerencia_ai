import 'package:flutter/material.dart';

class CardNotaWidget extends StatelessWidget {
  const CardNotaWidget({
    super.key,
    this.width,
    this.height,
    this.cardDecoration,
    this.cardPadding,
    this.titleCard,
    this.valorText,
    this.dataText,
    required this.tap,
    required this.title,
    required this.data,
    required this.value,
  });

  final double? width;
  final double? height;
  final BoxDecoration? cardDecoration;
  final EdgeInsets? cardPadding;
  final Text? titleCard;
  final Text? valorText;
  final Text? dataText;
  final Function() tap;

  final String title;
  final String data;
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: width ?? 170,
        height: height ?? 180,
        decoration: cardDecoration ??
            BoxDecoration(
              color: const Color(0xffffc041),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(4, 8),
                ),
              ],
            ),
        child: Padding(
          padding: cardPadding ??
              const EdgeInsets.only(
                top: 8,
                left: 18,
                right: 10,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Nome:'),
              titleCard ??
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xff4f3716),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 4),
              const Text('Data:'),
              dataText ??
                  Text(
                    data,
                    style: const TextStyle(
                      color: Color(0xff4f3716),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 4),
              const Text('Valor:'),
              valorText ??
                  Text(
                    'R\$ ${double.parse(value).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color(0xff4f3716),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
