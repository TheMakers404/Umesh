import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:campusbuzz/nav.dart';
import 'package:campusbuzz/retrieve.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'frgtpass.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({
    super.key,
  });

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void loginAccount(BuildContext context) async {
    String emailStr = emailController.text.trim();
    String passwordStr = passwordController.text.trim();

    if (emailStr == "" || passwordStr == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Empty Fields',
        desc: 'Fill all the required fields',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
      log("Empty fields");
    } else {
      try {
        UserCredential uc = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailStr, password: passwordStr);
        if (uc.user != null) {
        User? current_user = FirebaseAuth.instance.currentUser;
          // current_user.updateDisplayName();
log("------------------------------------------------------------------------------------------------------------------------------");
String unique_user_id = await current_user?.uid ?? "Username";
log("Current Users ID:${unique_user_id}");
log("------------------------------------------------------------------------------------------------------------------------------");
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => const retrieve()));
        }
      } on FirebaseAuthException catch (ex) {
        String lexp = ex.code.toString();

        if (lexp == "wrong-password") {
          // dialogbox for wrong password
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Wrong Password',
            desc: 'provide the correct password',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
          log("Wrong password");
        } else if (lexp == "invalid-email") {
          //dialogbox for invalid email address
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Wrong Email Format',
            desc: 'Use Correct Email Format',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
          log("Invalid Email Address");
        } else if (lexp == "user-not-found") {
          //dialogbox for user-not found
          AwesomeDialog(
            context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.rightSlide,
            title: 'User not found',
            desc: 'Use the Registered Email Address',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();

          log("user not found,Create Account");
        }
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 15, top: 10),
      //     child: IconButton(
      //       icon: const Icon(Icons.arrow_back_ios),
      //       color: Colors.black,
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        //  padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            const Image(
              image: AssetImage('assets/images/welcome.png'),
            
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                
              
                children: [
                  const Text(
                    "You've Been Missed!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                  "Welcome back to CampusBuzz! Dive in!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildGoogleSignInBlock(context),
                  Container(
                    width: 360,
                    height: 53,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(0, 237, 232, 232),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 360,
                    height: 53,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(24, 237, 232, 232),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 360,
                    height: 53,
                    child: ElevatedButton(
                      onPressed: () {
                        loginAccount(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF112031),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),

        
      ),
    );
  }
}

Widget _buildGoogleSignInBlock(BuildContext context) {
  void sigInviaGoogle(BuildContext context) async {
    log("Selected Google SignIn");

    //Create firebase auth
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    //SignOut all previous accounts
    await googleSignIn.signOut();

    //Trigger auth  flow
    GoogleSignInAccount? googleUser = await googleSignIn.signInSilently();
    if (googleUser == null) {
      googleUser = await googleSignIn.signIn();
    }

    //obtain details
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create user using details

    final AuthCredential uc = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //sigin in the user
    final UserCredential userCredential = await auth.signInWithCredential(uc);

    //navigation
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => const TabsScreen()));
  }
  return Column(
    children: [
          InkWell(
             onTap: () {
                // Handle Google sign in button press
                sigInviaGoogle(context);
              },
        child: Container(
          width: 360,
          height: 53,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE8E8),
            border: Border.all(color: const Color.fromARGB(123, 241, 237, 237)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [             
                 SizedBox(
                  height: 30,
                  child: Image.asset(
                      'assets/images/googleeee.png'),
                ),
              
              const SizedBox(width: 10),
              const Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10,),
      _buildDivider(),
    ],
  );
}

Widget _buildDivider() {
  return const Row(
    children: [
      Expanded(child: Divider()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          'or',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
      Expanded(child: Divider()),
    ],
  );
}

class InputField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final IconData? icon;

  const InputField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.icon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: widget.isPassword && !_isPasswordVisible,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
