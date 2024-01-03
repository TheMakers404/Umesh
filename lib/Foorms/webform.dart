// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class FormScreen1 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return FormScreenState();
//   }
// }

// class FormScreenState extends State<FormScreen1> {
//   List<String> type = ["popular", "clll"];
//   int price = 0;
//   String _imageFile = '';
//   Image? _selectedImage;
//   bool isImageSelected = false;

//   Uint8List? selectedImageInBytes;
//   Future<void> pickImage() async {
//     try {
//       // Pick image using file_picker package
//       FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//       );

//       // If user picks an image, save selected image to variable
//       if (fileResult != null) {
//         setState(() {
//           _imageFile = fileResult.files.first.name;
//           selectedImageInBytes = fileResult.files.first.bytes;
//           _selectedImage = Image.memory(selectedImageInBytes!);
//           isImageSelected = true;
//         });
//       }
//     } catch (e) {
//       // If an error occured, show SnackBar with error message
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Error:$e")));
//     }
//   }

//   // Method to upload selected image in flutter web
//   // This method will get selected image in Bytes
//   Future<String> uploadImage(Uint8List selectedImageInBytes) async {
//     try {
//       // Generate a unique filename for the image
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();

//       // This is the reference where the image will be uploaded in the Firebase Storage bucket
//       Reference ref =
//           FirebaseStorage.instance.ref().child('Images/$fileName.jpg');

//       // Metadata to save image extension
//       final metadata = SettableMetadata(contentType: 'image/jpeg');

//       // UploadTask to finally upload the image
//       UploadTask uploadTask = ref.putData(selectedImageInBytes, metadata);

//       // After successfully uploading, return the download URL
//       await uploadTask.whenComplete(() => ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Image Uploaded"))));
//       return await ref.getDownloadURL();
//     } catch (e) {
//       // If an error occurred while uploading, show SnackBar with the error message
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//     return '';
//   }

//   final TextEditingController nController = TextEditingController();

//   // Create lists to store the values of the TextFormFields
//   List<List<String>> textFieldsValues =
//       List.generate(0, (index) => ['', '', '']);
//   List<String> sportNames = [];
//   List<String> participantCounts = [];
//   List<String> entryFees = [];

//   // List of field names
//   List<String> fieldNames = ['Sport Name', 'No of Participants', 'Entry Fee'];

//   void clearImage() {
//     // Implement logic to clear the selected image
//     setState(() {
//       isImageSelected = false;
//       _selectedImage = null;
//       // Clear _selectedImage or perform any other necessary actions
//     });
//   }

// // timepicker
//   TimeOfDay time = TimeOfDay(
//     hour: 12,
//     minute: 30,
//   );
//   String selectedPeriod = '';

//   //date picker

//   late DateTime _dateTime;
//   late String _formattedDate;

//   @override
//   void initState() {
//     super.initState();
//     _dateTime = DateTime.now();
//     _formattedDate = _formatDate(_dateTime);
//   }

//   void _showDatePicker() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2050),
//     ).then((value) {
//       if (value != null) {
//         setState(() {
//           _dateTime = value;
//           _formattedDate = _formatDate(value);
//         });
//       }
//     });
//   }

//   String _formatDate(DateTime date) {
//     return "${date.day}-${date.month}-${date.year}";
//   }

//   String _Location = '';
//   String _EVName = '';

//   String _CLGNAME = '';
//   String _EventTITLE = '';
//   String _DESCRIPTION = ''; //new line must be implem
//   String combinedTime = '';

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   Widget _buildLocation() {
//     return Column(children: [
//       const Padding(
//         padding: EdgeInsets.only(right: 27.0, bottom: 5),
//         child: Row(
//           children: [
//             Text(
//               "Location",
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               "*",
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             hintText: 'address',
//             hintStyle: TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true),
//         maxLength: null,
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return 'Name is Required';
//           }

//           return null;
//         },
//         onSaved: (String? value) {
//           _Location = value ?? '';
//         },
//       ),
//     ]);
//   }

//   Widget _buildEVNAME() {
//     return Column(children: [
//       const Padding(
//         padding: EdgeInsets.only(right: 27, bottom: 5),
//         child: Row(
//           children: [
//             Text(
//               'Event Name',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               '*',
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             hintText: 'Enter Event Name',
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true),
//         maxLength: null,
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return 'Name is Required';
//           }
//           return null;
//         },
//         onSaved: (String? value) {
//           _EVName = value ?? '';
//         },
//       )
//     ]);
//   }

//   Widget _buildCLGNAME() {
//     return Column(children: [
//       const Padding(
//         padding: EdgeInsets.only(right: 21, bottom: 5),
//         child: Row(
//           children: [
//             Text(
//               "College Name",
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               "*",
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             hintText: 'Enter Collage Name',
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true),
//         maxLength: null,
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return 'Name is Required';
//           }

//           return null;
//         },
//         onSaved: (String? value) {
//           _CLGNAME = value ?? '';
//         },
//       )
//     ]);
//   }

//   Widget _buildEVENTTITLE() {
//     return Column(children: [
//       const Padding(
//         padding: EdgeInsets.only(right: 24, bottom: 5),
//         child: Row(
//           children: [
//             Text(
//               "EVENT TITLE",
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               "*",
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             hintText: 'Enter THE NAME',
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true),
//         keyboardType: TextInputType.phone,
//         maxLength: null,
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return 'Name is requierd';
//           }

//           return null;
//         },
//         onSaved: (String? value) {
//           _EventTITLE = value ?? '';
//         },
//       )
//     ]);
//   }

//   Widget _buildprice() {
//     return Column(children: [
//       const Padding(
//         padding: EdgeInsets.only(right: 24, bottom: 5),
//         child: Row(
//           children: [
//             Text(
//               "Price",
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               "*",
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             hintText: 'Enter Amount',
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true),
//         keyboardType: TextInputType.phone,
//         maxLength: null,
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return 'Number is requierd';
//           }
//           if (int.tryParse(value) == null) {
//             return 'Enter an integer value';
//           }

//           return null;
//         },
//         onSaved: (String? value) {
//           price = int.parse(value ?? '0');
//         },
//       )
//     ]);
//   }

//   Widget _buiLdDESCRIPTION() {
//     return Column(children: [
//       const Padding(
//         padding: EdgeInsets.only(right: 20, bottom: 5),
//         child: Row(
//           children: [
//             Text(
//               "DESCRIPTION",
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               "*",
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(5.5)),
//             hintText: '       brief description...............    ',
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true),
//         maxLength: null,
//         maxLines: 10,
//         validator: (String? value) {
//           if (value!.isEmpty) {
//             return 'requierd';
//           }

//           return null;
//         },
//         onSaved: (String? value) {
//           _DESCRIPTION = value ?? '';
//         },
//       )
//     ]);
//   }

//   Widget _buildAddFiles() {
//     return Column(
//       children: [
//         const Row(
//           children: [
//             Text(
//               "Upload File",
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               "*",
//               style: TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//         Stack(children: [
//           Align(
//             alignment: Alignment.center,
//             child: IconButton(
//               onPressed: isImageSelected
//                   ? null
//                   : () async {
//                       pickImage();
//                     },
//               icon: Column(children: [
//                 _selectedImage != null
//                     ? Container(
//                         height: 300,
//                         width: 500,
//                         decoration: const BoxDecoration(
//                             // border: Border.all(color: Colors.black),
//                             ),
//                         child: ClipRRect(
//                           // borderRadius: BorderRadius.circular(8.0),
//                           child: FittedBox(
//                             fit: BoxFit.cover,
//                             child: _selectedImage!,
//                           ),
//                         ))
//                     : DottedBorder(
//                         color: Colors.black,
//                         borderType: BorderType.RRect,
//                         radius: const Radius.circular(20),
//                         strokeWidth: 1.5,
//                         dashPattern: const [9, 3],
//                         child: Container(
//                           height: 100,
//                           width: 100,
//                           child: const Icon(
//                             Icons.add,
//                             color: Color.fromARGB(255, 110, 110, 110),
//                             size: 40,
//                           ),
//                         ),
//                       ),
//               ]),
//             ),
//           ),
//           if (isImageSelected)
//             Positioned(
//               top: 0,
//               right: 400,
//               child: Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(1),
//                       spreadRadius: -4,
//                       blurRadius: 8,
//                       offset: const Offset(0, 10), // changes position of shadow
//                     ),
//                   ],
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     clearImage();
//                   },
//                   icon: const Icon(Icons.close, color: Colors.black),
//                 ),
//               ),
//             ),
//           if (!isImageSelected)
//             const Padding(
//               padding: EdgeInsets.only(left: 8),
//               child: Text(
//                 '(Image required)',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//         ]),
//       ],
//     );
//   }

//   Widget _buiLdTime() {
//     final hours = time.hour.toString().padLeft(2, '0');
//     final minutes = time.minute.toString().padLeft(2, '0');
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Time Picker"),
//         Text(
//           '$hours:$minutes $selectedPeriod',
//           style: const TextStyle(fontSize: 39),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         ElevatedButton(
//             onPressed: () async {
//               combinedTime = '$hours:$minutes $selectedPeriod';

//               TimeOfDay? newTime =
//                   await showTimePicker(context: context, initialTime: time);

//               if (newTime == null) return;

//               String period = newTime.period == DayPeriod.am ? 'AM' : 'PM';
//               setState(() {
//                 time = newTime;
//                 selectedPeriod = period;
//               });
//             },
//             child: const Text("Pick time"))
//       ],
//     );
//   }

//   Widget _buildDate() {
//     return Column(
//       children: [
//         const Text(
//           "Testing date picker",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//         ),
//         MaterialButton(
//           onPressed: _showDatePicker,
//           child: const Text("Select date"),
//         ),
//         Text(
//           _formattedDate,
//           style: const TextStyle(fontSize: 20),
//         ),
//       ],
//     );
//   }

//   Widget _buildExtrafield() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: nController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(labelText: 'Enter No of Event'),
//             ),
//             const SizedBox(height: 16),
//             // Create n * 3 TextFormFields using a nested loop
//             ElevatedButton(
//               onPressed: () {
//                 // Get the value of n from the TextFormField
//                 int n = int.tryParse(nController.text) ?? 0;

//                 // Update the UI with the new number of rows
//                 setState(() {
//                   textFieldsValues = List.generate(n, (index) => ['', '', '']);
//                   sportNames = List.filled(n, '');
//                   participantCounts = List.filled(n, '');
//                   entryFees = List.filled(n, '');
//                 });
//               },
//               child: const Text('Generate TextFields'),
//             ),
//             const SizedBox(height: 16),
//             if (textFieldsValues.isNotEmpty)
//               // Create n * 3 TextFormFields using a nested loop
//               for (int i = 0; i < textFieldsValues.length; i++)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Sport ${i + 1}"),
//                     for (int j = 0; j < 3; j++)
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormField(
//                           decoration:
//                               InputDecoration(labelText: '${fieldNames[j]}'),
//                           onChanged: (value) {
//                             // Update the corresponding value in the list
//                             setState(() {
//                               textFieldsValues[i][j] = value;

//                               // Update the separate arrays
//                               if (j == 0) {
//                                 sportNames[i] = value;
//                               } else if (j == 1) {
//                                 participantCounts[i] = value;
//                               } else if (j == 2) {
//                                 entryFees[i] = value;
//                               }
//                             });
//                           },
//                         ),
//                       ),
//                   ],
//                 )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference eventsCollection =
//         FirebaseFirestore.instance.collection('Event');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Form Demo",
//           style: TextStyle(
//               color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.all(24),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 _buildCLGNAME(),
//                 const SizedBox(height: 15),
//                 _buildLocation(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 60,
//                   width: 500,
//                   child: Container(
//                       width: 400,
//                       height: 100,
//                       color: Colors.white,
//                       child: const Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: Text(
//                           '             Event details',
//                           style: TextStyle(fontSize: 30),
//                         ),
//                       )),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 _buildEVNAME(),
//                 const SizedBox(height: 15),
//                 _buildEVENTTITLE(),
//                 const SizedBox(height: 15),
//                 _buiLdDESCRIPTION(),
//                 const SizedBox(height: 15),
//                 _buildAddFiles(),
//                 const SizedBox(height: 15),
//                 _buildprice(),
//                 const SizedBox(height: 20),
//                 _buiLdTime(),
//                 const SizedBox(height: 20),
//                 _buildDate(),
//                 const SizedBox(height: 15),
//                 _buildExtrafield(),
//                 const SizedBox(height: 50),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: MaterialButton(
//                     color: const Color(0xff112031),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                     onPressed: () async {
//                       if (!_formKey.currentState!.validate()) {
//                         return;
//                       }

//                       _formKey.currentState?.save();
//                       String imageUrl =
//                           await uploadImage(selectedImageInBytes!);
//                       await eventsCollection.add({
//                         'college_name': _CLGNAME,
//                         'location': _Location,
//                         'EVName': _EVName,
//                         'title': _EventTITLE,
//                         'about_event_content': _DESCRIPTION,
//                         'categories': "c2",
//                         'id': '8121',
//                         'imageUrl': imageUrl,
//                         'time': combinedTime,
//                         'date': _formattedDate,
//                         'sportNames': sportNames,
//                         'participantCounts': participantCounts,
//                         'entry fee': entryFees,
//                         'price': price,
//                         'about_event_title': "about event",
//                         'type': type,
//                         // 'Category': "c1",
//                       });
//                       _formKey.currentState?.reset();

//                       // print(_CLGNAME);
//                       // print(_Location);
//                       // print(_EVName);
//                       // print(_EventTITLE);
//                       // print(_DESCRIPTION);
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.all(13),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Register Now",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15,
//                                 color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // ElevatedButton(
//                 //   child: const Text(
//                 //     'Submit',
//                 //     style: TextStyle(color: Colors.white, fontSize: 16),
//                 //   ),
//                 //   onPressed: () {
//                 //     if (!_formKey.currentState!.validate()) {
//                 //       return;
//                 //     }

//                 //     _formKey.currentState?.save();

//                 //     print(_name);
//                 //     print(_email);
//                 //     print(_phoneNumber);
//                 //      print(_Leader);
//                 //     print(_CLGNAME);

//                 //      print(_AboutAbstract);
//                 //   print(dropdownValue);

//                 //     //Send to API
//                 //   },
//                 // )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
