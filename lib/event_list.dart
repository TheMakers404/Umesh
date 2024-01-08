import 'dart:developer';

import 'package:campusbuzz/categories.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //import 'package:campusbuzz_mainui/data/event_list.dart';

// Constants in Dart should be written in lowerCamelcase.
const AvailableCategories = [
  Categori(id: 'c1', Ctitle: 'Fests', color: Color.fromARGB(255, 255, 255, 255),categimg: 'images/festt.png'),
  Categori(id: 'c2', Ctitle: 'Sports', color: Color.fromARGB(83, 255, 255, 255),categimg: 'images/sportt.png'),
  Categori(id: 'c3', Ctitle: 'Cultural', color: Color.fromARGB(255, 255, 255, 255),categimg: 'images/festt.png'),
  Categori(id: 'c4', Ctitle: 'Tech', color: Color.fromARGB(92, 255, 255, 255),categimg: 'images/techh.png'),
  Categori(id: 'c5', Ctitle: 'Talks', color: Color.fromARGB(255, 255, 255, 255),categimg: 'images/sportt.png'),
  Categori(id: 'c6', Ctitle: 'Hackathon', color: Color.fromARGB(255, 255, 255, 255),categimg: 'images/techh.png'),


];

//event details
List<Event> Event_details = [];
  
Future<List<Event>> gettingData() async {
  log("------------------------------------------------------------------------------------------------------------------------------");
  log("Retrieving Data....");
  try {
    final QuerySnapshot eventSnapshot =
        await FirebaseFirestore.instance.collection('Event').get();
    // log('Number of documents retrieved: ${eventSnapshot.size}');

    // Map each document in the QuerySnapshot to an Event object.
    final List<Event> events = eventSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      // log('Document ID: ${doc.id}');
      return Event(
        id: "${data['id']}",
        // id: data['id'],
        college_name: data['college_name'],
        type: List<String>.from(data['type']),
        categories: data['categories'],
        date: data['date'],
        title: data['title'],
        imageUrl: data['imageUrl'],
        time: data['time'],
        about_event_title: data['about_event_title'],
        about_event_content: data['about_event_content'],
        price: data['price'],
        location: data['location'],
      );
    }).toList();

    Event_details = events;

    log("------------------------------------------------------------------------------------------------------------------------------");
    return events;
  } catch (error) {
    // Handle errors here, e.g., logging or displaying an error message.
    log('Error fetching events: $error');
    return [];
  }
}

//End of gettingData()
//Add documents in firestore with all all the parameters which list demands
// make sure the names are correct

// Eg:
// title: data['title'],
// The first title is the key of the list
// whereas second title in Squard brackets is database field(don't change)

//To add any event i have provided an sample event structure in the firestore ,
// refer it and create new one

//Since the images are displayed using paths
// in Databse in place of imageUrl field paste the required image path
//from thepubspec.yaml
