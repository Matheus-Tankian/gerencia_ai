import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfWidget extends StatelessWidget {
  const PdfWidget({
    super.key,
    required this.pdf,
  });

  final String pdf;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PDF'),
          backgroundColor: const Color(0xfff9a826),
        ),
        body: SfPdfViewer.network(
          pdf,
        ),
      ),
    );
  }
}
