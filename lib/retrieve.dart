
import 'dart:async';
import 'dart:developer';

import 'package:campusbuzz/nav.dart';
import 'package:campusbuzz/retrieveError.dart';
import 'package:campusbuzz/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'event_list.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   // gettingData();

  
//   runApp(MaterialApp(home:retrieve()));
  
// }



class retrieve extends StatefulWidget {
  const retrieve({super.key});

  @override
  State<retrieve> createState() => _retrieveState();
}

class _retrieveState extends State<retrieve> {

@override
  void initState() {
    super.initState();
    displayData(); // Call the displayData function when the widget is initialized.
  }

  Future<void> retrievalWorks() async{
    //Retrieving Events
    await gettingData();

  }

  Future<void> displayData() async{
    final user = FirebaseAuth.instance.currentUser;

      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? current_user = FirebaseAuth.instance.currentUser;
log("------------------------------------------------------------------------------------------------------------------------------");
log("Current User:${current_user}");
log("------------------------------------------------------------------------------------------------------------------------------");



  runApp(
    FutureBuilder(
      future:
       // or context.readProvider
        retrievalWorks(),
          
          
           // Assuming gettingData returns a Future<List<Event>>
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Error occurred while fetching data
          return (MaterialApp(home:retrieveErrorScreen()));
        } 
        else if (snapshot.connectionState == ConnectionState.done) {
          log("Inside the final task");
          // **** Redirect to TabsScreen here **** 
        final tabsScreen = const Directionality(
              textDirection: TextDirection.ltr, // or TextDirection.rtl as needed
              child: TabsScreen(),
            );

            // Return TabsScreen wrapped with Directionality
            return ProviderScope(
              child: MaterialApp(home: tabsScreen),
            );

        }
        else {
          // Data retrieval is in progress, show a loading indicator
          // return MaterialApp(
          //   home: Scaffold(
          //     body: Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //   ),
          // );
          return (MaterialApp(home:ShimmerEffectWidget()));
        }
      },
    ),
  );

  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}