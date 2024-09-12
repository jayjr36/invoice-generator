import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final pdf = pw.Document();
  final invoiceData = {
    'invoiceNumber': '001',
    'invoiceDate': DateTime.now().toString(),
    'billTo': 'John Doe',
    'itemList': [
      {'description': 'Apple', 'quantity': 3, 'unitPrice': 10.0},
      {'description': 'Banana', 'quantity': 4, 'unitPrice': 5.0},
      {'description': 'Orange', 'quantity': 5, 'unitPrice': 7.0},
    ],
    'total': 28.0,
  };

  @override
  void initState() {
    super.initState();
    generatePdf();
  }

  Future<void> generatePdf() async {
    final itemList = invoiceData['itemList'] ?? [];
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Invoice Number: ${invoiceData['invoiceNumber']}',
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.Text('Invoice Date: ${invoiceData['invoiceDate']}'),
              pw.Text('Bill To: ${invoiceData['billTo']}'),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: ['Description', 'Quantity x Unit Price', 'Total'],
                data: [
                  if (invoiceData['itemList'] != null) ...[
                    for (var item in invoiceData['itemList']
                        as List<Map<String, dynamic>>)
                      [
                        item['description'],
                        '${item['quantity']} x ${item['unitPrice']}',
                        (item['quantity'] * item['unitPrice'])
                            .toStringAsFixed(2),
                      ],
                  ],
                  ['Total', '', invoiceData['total']],
                ],
              ),
            ],
          );
        },
      ),
    );
    savePdf();
  }

  Future<void> savePdf() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/invoice.pdf');
      await file.writeAsBytes(await pdf.save());
      OpenFile.open(file.path);
    } catch (e) {
      print("Error saving PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice PDF View'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: generatePdf,
          child: const Text('Generate PDF'),
        ),
      ),
    );
  }
}
