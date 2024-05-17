import 'package:barcode_widget/barcode_widget.dart';
import 'package:campusbuzz/pdf/paf_api.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
//pdf ticket
// class Invoice{
//   final Eventdetails eventdetails;
//   final Something something;


//   Invoice({
//   required this.eventdetails,
//   required this.something});


// }

// class Something {
//   final String location;
//   const Something({required this.location});
// }

// class Eventdetails {
//   final String title;
//   final String date;
//   final String time;

//   Eventdetails({
//     required this.title,
//     required this.date,
//     required this.time,
//   });
// }

//your events screen ticket
class Evvent {
  final String College_Name;
  final String Name;
  final String Mail_Id;
  final String Mobile_No;
  final String Year;
  final String Branch;
  final int amount;

  final String token;
  final String imageUrl;
  final String time;
  final String date;
  final String title;
  final String leaderName;
  final String college_name;

  

  Evvent(  {
    required this.token,
    required this.imageUrl,
    required this.time,
    required this.date,
    required this.title,
    required this.leaderName,
    required this.college_name, 
    required this.College_Name,required this.Name, 
    required this.Mail_Id, required this.Mobile_No, required this.Year, required this.Branch, required this.amount,
  });
}

class TokenDisplayScreen extends StatefulWidget {
  final Evvent event;

  const TokenDisplayScreen({super.key, required this.event});

  @override
  State<TokenDisplayScreen> createState() => _TokenDisplayScreenState();
}

class _TokenDisplayScreenState extends State<TokenDisplayScreen> {
  late final List<Evvent> events;
  late ConfettiController _confettiController;
  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 5));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final PdfInvoiceService service = PdfInvoiceService();
    // int number = 0;

    return  Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Ticket",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding:
                       const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Container(
                    height: 545,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: -8,
                          blurRadius: 20,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                widget.event.imageUrl,
                                height: 200,
                              )),
                        ),
    
                        Positioned(
                          top: 220,
                          left: 20,
                          child: Text(
                            widget.event.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          top: 265,
                          left: 15,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.red,
                                size: 30,
                              ),
                              Text(
                                widget.event.college_name,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 300),
                          child: Divider(thickness: 0.5),
                        ),
    
                        //name
                        const Positioned(
                          top: 320,
                          left: 20,
                          child: Text(
                            "Name",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
    
                        Positioned(
                          top: 335,
                          left: 20,
                          child: Text(
                            widget.event.leaderName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        //date
    
                        const Positioned(
                          top: 375,
                          left: 20,
                          child: Text(
                            "Date",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Positioned(
                            top: 390,
                            left: 20,
                            child: Text(
                              widget.event.date,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )),
    
                        //time
                        const Positioned(
                          top: 375,
                          left: 200,
                          child: Text(
                            "Time",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Positioned(
                            top: 390,
                            left: 200,
                            child: Text(
                              widget.event.time,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(top: 415),
                          child: Divider(thickness: 0.5),
                        ),
                        Positioned(
                          top: 435,
                          left: 52,
                          child: BarcodeWidget(
                            barcode: Barcode.code128(),
                            data: widget.event.token,
                            // data: '${widget.event}.token',
                          ),
                        ),
    
                        //confetti
                      //  ConfettiWidget(
                      //   confettiController: _confettiController,
                      //   blastDirection: -pi/2,
                      //   emissionFrequency: 0.1,
                      //   numberOfParticles: 50,
                      //   minBlastForce: 10,
                      //   maxBlastForce: 100,
                      // ),
                    
                        
    
                        //token id
                        // Positioned(
                        //   top: 450,
                        //   left: 20,
                        //   child: Text(
                        //     "Your Unique Token:\n $token",
                        //     style: TextStyle(fontSize: 20, color: Colors.black),
                        //   ),
                        // ),
    
                        // Display the Image using the imageUrl
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: _createPDF, child: const Text("Download")),
              
            ],
          ),
        ),
      );
    
  }


   Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
     final page = document.pages.add();

      page.graphics.drawString('Welcome to PDF ',
        PdfStandardFont(PdfFontFamily.helvetica, 30));

    

    List<int> bytes =await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Ticket_Details.pdf');

    
  }
  


}

// class DataStorage {
//   static String imageUrl = '';
//   static String time = '';
//   static String date = '';
//   static String title = '';
//   static String collegeName = '';
//   static String uniqueToken= '';
//   static String leaderName='';
// }


