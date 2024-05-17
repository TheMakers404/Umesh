import 'dart:developer';

import "package:awesome_dialog/awesome_dialog.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'welcomeback.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  void passwordReset() async {
    String emailStr = emailController.text.trim();

    if (emailStr == "") {
      //Dialog box for Empty field
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Empty Fields',
        desc: 'Fill all the required fields',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
      log("Email has been not provided");
    } else {
      final List<String> userExistList =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailStr);

      if (userExistList.isEmpty) {
        //Dialog box for Not Registred Email
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Could not find the account',
          desc: 'The Provided Email has been not registered',
          // btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )..show();
        log("Email is not registered");
      } else {
        FirebaseAuth.instance.sendPasswordResetEmail(email: emailStr);
        //Dialog box for Password Reset Email sent
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Reset Email Sent',
          desc: 'You can Reset your Password',
          // btnCancelOnPress: () {},
          btnOkOnPress: () {
              Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const WelcomeBackScreen()));
          },
        )..show();
        log("Password reset Email has been sent");
    
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Color(0xFF112031)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromARGB(227, 15, 14, 14)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: Image.asset(
                  'assets/images/forgot.png',
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Forgot Your Password?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF112031),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
              "Password lost? No problem! Enter your email, and we'll send a reset link.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 360, // Increase the width of the TextField
                height: 53,
                child: TextField(
                  controller:emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Registered Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 360, // Increase the width of the ElevatedButton
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xFF112031),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Send password reset link logic
                    passwordReset();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Send Reset Link',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 200), // Add more space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ForgotPasswordScreen(),
//   ));
// }
