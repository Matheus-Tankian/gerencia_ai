class NotaModel {
  final String id;
  final String notaName;
  final String notaData;
  final String notaDescription;
  final String notaPrice;
  final String linkPdf;

  NotaModel({
    required this.id,
    required this.notaDescription,
    required this.notaName,
    required this.notaData,
    required this.notaPrice,
    required this.linkPdf,
  });
}
