import 'dart:developer';
import 'dart:io';

import 'package:campusbuzz/token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
class FormScreen1 extends StatefulWidget {
  const FormScreen1({
    super.key, required this.imageUrl, required this.time, required this.date, required this.title, required this.college_name, required this.id,
  });

  final String imageUrl;
  final String time;
  final String date;
  final String title;
  final String college_name;

  final String id;


  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen1> {
  Map<String, dynamic>? fileData;
  String selectedFileName = 'NOFileSelected';
  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String?> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");

    try {
      final uploadTask = reference.putFile(file);

      await uploadTask.whenComplete(() {});

      final downloadLink = await reference.getDownloadURL();
      print('successfully uploaded');
      print(downloadLink);

      return downloadLink;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState?.save();

    if (fileData != null) {
      Map<String, dynamic> formData = {
        "Team Name": _name,
        "Email Id": _email,
        "Leader Name": _Leader,
        "collage Name": _CLGNAME,
        "phone Number": _phoneNumber,
        "About Abstract": _AboutAbstract,
        "Teamsize": dropdownValue,
        "pdfName": fileData!["pdfName"],
        "pdfUrl": fileData!["pdfUrl"],
      };

      // Store form data and file data together in Firestore
      // Replace this with your Firestore code
      await FirebaseFirestore.instance.collection("Test12").add(formData);
      _formKey.currentState?.reset();

      Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TokenDisplayScreen(event: Evvent(token: "token", imageUrl: widget.imageUrl, time: widget.time, date: widget.date, title: widget.title, leaderName:_Leader, college_name: widget.college_name, College_Name: "widget.College_Name", Name: "widget.Name", Mail_Id: "Mail_Id", Mobile_No: "Mobile_No", Year: "Year", Branch: "Branch", amount: 1),),
            ),
          );

      // For now, log the data
      log("Form Data: $formData");
    } else {
      // Handle if fileData is not available
    }
  }

  void _pickAndUploadFile() async {
    final filePicked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePicked != null) {
      setState(() {
        selectedFileName = filePicked.files.single.name;
      });
      String fileName = filePicked.files[0].name;
      print(fileName);
      File file = File(filePicked.files[0].path!);
      final downloadLink = await uploadPdf(fileName, file);

      if (downloadLink != null) {
        fileData = {
          "pdfName": fileName,
          "pdfUrl": downloadLink,
        };

        // Now, submit the form data and file data together
      }
    }
  }

  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  String dropdownValue = '1';
  String _name = '';
  String _email = '';
  String _Leader = '';
  String _CLGNAME = '';
  String _phoneNumber = '';
  String _AboutAbstract = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 27.0, bottom: 5),
        child: Row(
          children: [
            Text(
              "Team Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Name',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String? value) {
          _name = value ?? '';
        },
      ),
    ]);
  }

  Widget _buildEmail() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 27, bottom: 5),
        child: Row(
          children: [
            Text(
              'Email ID',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '*',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter Mail Id',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }
          if (!RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                  r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                  r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                  r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                  r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                  r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                  r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (String? value) {
          _email = value ?? '';
        },
      )
    ]);
  }

  Widget _buildLeader() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 22, bottom: 5),
        child: Row(
          children: [
            Text(
              "Team Leader",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Name',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String? value) {
          _Leader = value ?? '';
        },
      ),
    ]);
  }

  Widget _buildCLGNAME() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 21, bottom: 5),
        child: Row(
          children: [
            Text(
              "College Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter Collage Name',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String? value) {
          _CLGNAME = value ?? '';
        },
      )
    ]);
  }

  Widget _buildPhoneNumber() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
        child: Row(
          children: [
            Text(
              "Mobile No",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Number',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        keyboardType: TextInputType.phone,
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Number is requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _phoneNumber = value ?? '';
        },
      )
    ]);
  }

  Widget _buiLdAboutAbstract() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 20, bottom: 5),
        child: Row(
          children: [
            Text(
              "About Abstract",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: '       brief description...............    ',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        maxLines: 10,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _AboutAbstract = value ?? '';
        },
      )
    ]);
  }

  Widget _builddropdownbox() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Team Size",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(5.5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              value: dropdownValue,
              isExpanded: true,
              borderRadius: BorderRadius.circular(5.5),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue ?? '';
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddFiles() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Upload File",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 20),
        selectedFileName != 'NOFileSelected'
            ? Stack(children: [
                InkWell(
                  onTap: () async {
                    if (fileData != null && fileData!["pdfUrl"] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewer(fileData!["pdfUrl"]),
                        ),
                      );
                    }
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedFileName.length > 20
                                ? '${selectedFileName.substring(0, 20)}...'
                                : selectedFileName,
                            style: const TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFileName = 'NOFileSelected';
                      fileData = null;
                    });
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ),
              ])
            : GestureDetector(
                onTap: _pickAndUploadFile,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 5),
                        Text("Add File"),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Form Demo",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildName(),
                const SizedBox(height: 15),
                _buildEmail(),
                const SizedBox(height: 15),
                _buildPhoneNumber(),
                const SizedBox(height: 15),
                _buildCLGNAME(),
                const SizedBox(height: 15),
                _buildLeader(),
                const SizedBox(height: 15),
                _buiLdAboutAbstract(),
                const SizedBox(height: 15),
                _builddropdownbox(),
                const SizedBox(height: 51),
                _buildAddFiles(),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MaterialButton(
                    color: const Color(0xff112031),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: _submitForm,
                    child: const Padding(
                      padding: EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final String filePath;

  const PdfViewer(this.filePath, {super.key});

  @override
  Widget build(BuildContext context) {
    log("PDF Viewer File Path: $filePath");
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
