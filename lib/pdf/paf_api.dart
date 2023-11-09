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

//   static Widget buildTitle(Invoice invoice)=>
//   Column(
//     children: [
//       SizedBox(height: 1 * PdfPageFormat.cm),
//       Text("INVOICE"),
      
//     ]
//   );
// }
  
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class PdfInvoiceService{

  Future<Uint8List> createHelloWorld() {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenDocument.openDocument(filePath: filePath);
  }

  


}