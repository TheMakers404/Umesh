import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class Evvent {
  final String token;
  final String imageUrl;
  final String time;
  final String date;
  final String title;
  final String leaderName;
  final String college_name;

  Evvent({
    required this.token,
    required this.imageUrl,
    required this.time,
    required this.date,
    required this.title,
    required this.leaderName,
    required this.college_name,
  });
}

class TokenDisplayScreen extends StatefulWidget {
  final Evvent event;

  TokenDisplayScreen({required this.event});

  @override
  State<TokenDisplayScreen> createState() => _TokenDisplayScreenState();
}

class _TokenDisplayScreenState extends State<TokenDisplayScreen> {
  @override
  Widget build(BuildContext context) {
// DataStorage.imageUrl = widget.event.imageUrl;
//                       DataStorage.time = widget.event.time;
//                       DataStorage.date = widget.event.date;
//                       DataStorage.title = widget.event.title;
//                       DataStorage.collegeName = widget.event.college_name;
//                       DataStorage.leaderName = widget.event.leaderName;

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        iconTheme: IconThemeData(
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
                        offset: Offset(0, 0), // changes position of shadow
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
                            child: Image.asset(
                              widget.event.imageUrl,
                              height: 200,
                            )),
                      ),

                      Positioned(
                        top: 220,
                        left: 20,
                        child: Text(
                          widget.event.title,
                          style: TextStyle(
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
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Divider(thickness: 0.5),
                      ),

                      //name
                      Positioned(
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
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //date

                      Positioned(
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
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )),

                      //time
                      Positioned(
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
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 415),
                        child: Divider(thickness: 0.5),
                      ),
                      Positioned(
                        top: 435,
                        left: 52,
                        child: BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: '${widget.event}.token',
                        ),
                      ),
                      Positioned(
                          top: 445, left: 52, child: Text(widget.event.token)),

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
            ElevatedButton(onPressed: () {}, child: Text("Download"))
          ],
        ),
      ),
    );
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