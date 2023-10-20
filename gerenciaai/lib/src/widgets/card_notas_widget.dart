import 'dart:developer';

import 'package:flutter/material.dart';

class CardNotaWidget extends StatelessWidget {
  const CardNotaWidget(
      {super.key,
      this.width,
      this.height,
      this.cardDecoration,
      this.cardPadding,
      this.titleCard,
      this.valorText,
      this.dataText});

  final double? width;
  final double? height;
  final BoxDecoration? cardDecoration;
  final EdgeInsets? cardPadding;
  final Text? titleCard;
  final Text? valorText;
  final Text? dataText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('Card');
      },
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
                  offset: const Offset(4, 8), // changes position of shadow
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
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    log('valor icone');
                  },
                  child: const Icon(Icons.more_vert),
                ),
              ),
              const Text('Nome:'),
              titleCard ??
                  const Text(
                    'Projeto 1 ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff4f3716),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 4),
              const Text('Valor:'),
              valorText ??
                  const Text(
                    'R\$100',
                    style: TextStyle(
                      color: Color(0xff4f3716),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 4),
              const Text('Data:'),
              dataText ??
                  const Text(
                    '11 Set 2001',
                    style: TextStyle(
                      color: Color(0xff4f3716),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
