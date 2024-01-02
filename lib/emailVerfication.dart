// import 'dart:developer';

// import 'package:auth_handler/auth_handler.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:campusbuzz/nav.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class EmailVerificationScreen extends StatefulWidget {
//   String pemailStr;
//   String ppasswordStr;
//   String pOtp;
//   EmailVerificationScreen(
//       {required this.pemailStr, required this.ppasswordStr , required this.pOtp});

//   @override
//   State<EmailVerificationScreen> createState() =>
//       _EmailVerificationScreenState(pemailStr, ppasswordStr , pOtp);
// }

// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   String pemailStr;
//   String ppasswordStr;
//   String pOtp;
//   _EmailVerificationScreenState(this.pemailStr, this.ppasswordStr, this.pOtp);
//   // TextEditingController emailController = TextEditingController();
//   TextEditingController otpController = TextEditingController();

//   AuthHandler authHandler = AuthHandler(); // Declare the AuthHandler instance

//   @override
//   void initState() {
//     super.initState();



//     // Configure the AuthHandler instance in the initState method
//     authHandler.config(
//       senderEmail: "campussbuzz@gmail.com",
//       senderName: "Team - CampusBuzz",
//       otpLength: 6,
//     );
//   }


    

//   void createVerifiedAccount() async {
//     try {
//       // To prevent firebase Auth Exception(occurs if usere already exists)
//       // create the account here
//       UserCredential uc = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: pemailStr, password: ppasswordStr);
//                     Navigator.pushReplacement(
//                   context, CupertinoPageRoute(builder: (context) => TabsScreen()));        
//     } on FirebaseAuthException catch(exp) {
//       // Dialog box for User Already Exist
//       log("Error occured $exp");
//     }
//   }
// void sendOTP() async {
// await authHandler.sendOtp(pemailStr);
// try{

//         AwesomeDialog(
//           context: context,
//           dialogType: DialogType.success,
//           animType: AnimType.rightSlide,
//           title: 'OTP Sent',
//           desc: 'A OTP has been sent on your Email',
//           // btnCancelOnPress: () {},
//           btnOkOnPress: () {
//           }
            
//         )..show();

// }catch(e){
//   log("Error:$e");
// }
//   }



// void reSendOtp() async {
//     try {
//       await authHandler.sendOtp(pemailStr);
//       AwesomeDialog(
//         context: context,
//         dialogType: DialogType.success,
//         animType: AnimType.rightSlide,
//         title: 'OTP has been Resent',
//         desc: 'Check your Inbox',
//         // btnCancelOnPress: () {},
//         btnOkOnPress: () {},
//       )..show();
//     } catch (e) {
//       AwesomeDialog(
//         context: context,
//         dialogType: DialogType.error,
//         animType: AnimType.rightSlide,
//         title: 'Failed to Send OTP',
//         desc: 'Check your Email Address',
//         btnCancelOnPress: () {},
//         btnOkOnPress: () {},
//       )..show();
//     }
//   }

//   void verifyOTP(BuildContext context) async {
//     await authHandler.sendOtp(pemailStr);

//     String otpStr = otpController.text.trim();
//     if (otpStr == "") {
//       AwesomeDialog(
//         context: context,
//         dialogType: DialogType.warning,
//         animType: AnimType.rightSlide,
//         title: 'OTP not Entered',
//         desc: 'Enter OTP to verify Email',
//         // btnCancelOnPress: () {},
//         btnOkOnPress: () {},
//       )..show();
//     } else {
//       try {
        
//         bool checkOTP = await authHandler.verifyOtp(pOtp
//         //,otpStr
//         );
//         if (checkOTP) {
//           AwesomeDialog(
//             context: context,
//             dialogType: DialogType.success,
//             animType: AnimType.rightSlide,
//             title: 'Valid OTP',
//             desc: 'Account Creation Started',
//             // btnCancelOnPress: () {},
//             btnOkOnPress: () {
//               createVerifiedAccount();

//             },
//           )..show();
//         } else {
//           AwesomeDialog(
//             context: context,
//             dialogType: DialogType.error,
//             animType: AnimType.rightSlide,
//             title: 'Invalid OTP',
//             desc: 'Enter valid OTP to verify Email',
//             // btnCancelOnPress: () {},
//             btnOkOnPress: () {},
//           )..show();
//         }
//       } catch (e) {
//         log("Error verifying OTP: $e");
//       }
//     }
//   }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Email Verification',
//             style: TextStyle(color: Colors.black)),
//         backgroundColor:
//             Colors.white, // Set the background color of the AppBar to white
//         elevation: 0, // Remove the elevation/shadow
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 12.0), // Adjust padding
//           child: IconButton(
//             // Add a back arrow icon button
//             icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           // Add a SingleChildScrollView to make the content scrollable
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'ALMOST THERE!',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: const TextSpan(
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                   children: [
//                     TextSpan(
//                         text:
//                             'Hang in tight! Just one step \n left to unlock the '),
//                     TextSpan(
//                       text: 'Campus',
//                       style: TextStyle(
//                           color: Colors.black, fontWeight: FontWeight.bold),
//                     ),
//                     TextSpan(
//                       text: 'Buzz',
//                       style: TextStyle(
//                           color: Colors.red, fontWeight: FontWeight.bold),
//                     ),
//                     TextSpan(
//                       text: ' adventure.',
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10), // Add spacing
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Enter OTP', // Move the label above the text field
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   Container(
//                     width: 361,
//                     height: 53,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextFormField(
//                       controller: otpController,
//                       // Change the block to a text input field
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                          // Customize the hint text
//                       ),
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: 341,
//                 height: 48, // Change the height of the button
//                 decoration: BoxDecoration(
//                   color: const Color(
//                       0xFF112031), // Set the background color of the button
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child:  Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       verifyOTP(context);
//                     },
//                     child:const Text(
//                       'VERIFY EMAIL',
                      
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//                Row(
//                 // Separate the words "Resend OTP" a bit
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                 const   Text(
//                     'OTP not received? ',
//                     style: TextStyle(fontSize: 14, color: Colors.black),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       reSendOtp();
//                     },
//                     child:const Text(
//                       'RESEND OTP',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF112031)),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
















// }
