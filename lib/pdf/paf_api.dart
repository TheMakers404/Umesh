// import 'dart:io';

// import 'package:campusbuzz/token.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';

// class PdfApi{
//   static Future<File> SaveDocument({
//     required String name,
//     required Document pdf,
//   }) async{
//     final bytes = await pdf.save();

//     final dir = await getApplicationCacheDirectory();
//     final file = File('${dir.path}/$name');

//     return file;

//   }
//   static Future openFile(File file)async{
//   final url = file.path;
//   await OpenFile.open(url);
// }
// }




// class PdfInvoiceApi{
//   static  Future<File> generte(Invoice invoice)async{
//     final pdf = Document();

//     pdf.addPage(MultiPage(build: (context) =>[
//       buildTitle(invoice),

//     ]
//     ));

//     return PdfApi.SaveDocument(name: "Event_ticket",pdf: pdf);
//   }

import 'dart:io';

//   static Widget buildTitle(Invoice invoice)=>
//   Column(
//     children: [
//       SizedBox(height: 1 * PdfPageFormat.cm),
//       Text("INVOICE"),
      
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final path = (await getExternalStorageDirectory())!.path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  print("hiiiiiii");
  print('$path/$fileName');
  OpenFile.open('$path/$fileName');
}



//dio
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as pw;
// class PDFViewer extends StatelessWidget {
//   final Uint8List bytes;

//   PDFViewer({required this.bytes});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('PDF Viewer')),
//       body: PDFView(
//         filePath: null,
//         pdfData: bytes,
        
//       ),
//     );
//   }
// }

// Future<Uint8List> generateInvoice() async {
//   final pdf = pw.Document();
//   pdf.addPage(pw.Page(
//     build: (context) => pw.Center(child: pw.Text('Invoice details go here...')),
//   ));
//   return pdf.save();
// }

// Future<void> savePdfToLocal(Uint8List pdfBytes) async {
//   final Directory appDocDir = await getApplicationDocumentsDirectory();
//   final String appDocPath = appDocDir.path;
//   final String pdfPath = '$appDocPath/invoice.pdf';
//   final File file = File(pdfPath);
//   await file.writeAsBytes(pdfBytes, flush: true);
// }



