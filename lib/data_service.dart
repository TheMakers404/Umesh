import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Event {
  final String id;
  final String categories;
  final String date;
  final String title;
  final String imageUrl;
  final String time;
  final String college_name;
  final String about_event_title;
  final String about_event_content;
  final int price;

  Event({
    required this.id,
    required this.categories,
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.college_name,
    required this.about_event_title,
    required this.about_event_content,
    required this.price,
  });
}

class EventData extends StatefulWidget {
  const EventData({super.key});

  @override
  State<EventData> createState() => _EventDataState();
}

class _EventDataState extends State<EventData> {


  void printEventDetailsList(List<Event> eventList) {
    for (int i = 0; i < eventList.length; i++) {
      Event event = eventList[i];
      log("Event $i:");
      log("ID: ${event.id}");
      log("Categories: ${event.categories}");
      log("Date: ${event.date}");
      log("Title: ${event.title}");
      log("Image URL: ${event.imageUrl}");
      log("Time: ${event.time}");
      log("College Name: ${event.college_name}");
      log("About Event Title: ${event.about_event_title}");
      log("About Event Content: ${event.about_event_content}");
      log("Price: ${event.price}");
    }
  }

  List<Event> R_Event_details = [
    Event(
      id: 'm1',
      categories: "c1",
      date: 'Oct 18 2023',
      title: 'Aquila Fest 2023',
      imageUrl: 'images/event.jpg',
      time: '08:30 PM',
      college_name: "St. peter's engineering college",
      about_event_title: 'About Event',
      about_event_content:
          "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.",
      price: 300,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // fetchEventData();
    check();

    return Container();
  }

  Future<List<Event>> fetchEventData() async {
    // log("inside");
    final DatabaseReference ref = FirebaseDatabase.instance
        .ref("1tU0BkryAcRBG0GMo4QWvtAH5tnO2u-OHwXY4iCl_A6U")
        .child('All Events');
    // official id:1NiWJh6N_2MI9V-zhZIkr-3B_2zTkT105ATYsi0SZKlw
    List<Event> eventList = [];

    try {
      // log("Started Fetching.....");
      DatabaseEvent event = await ref.once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null && snapshot.value is Map<dynamic, dynamic>) {
        final eventData = snapshot.value as Map<dynamic, dynamic>;

        eventData.forEach((eventId, event) {
          if (event is Map<dynamic, dynamic>) {
            // log("Creaing the List......");
            event['Event Id'] = eventId;
            eventList.add(Event(
              id: eventId,
              categories: event['categories'] ?? '',
              date: event['date'] ?? '',
              title: event['title'] ?? '',
              imageUrl: event['imageUrl'] ?? '',
              time: event['time'] ?? '',
              college_name: event['collegeName'] ?? '',
              about_event_title: event['aboutEventTitle'] ?? '',
              about_event_content: event['aboutEventContent'] ?? '',
              price: event['price'] ?? 0,
            ));
          }
        });
      } else {
        log("No data available");
      }
    } catch (error) {
      log("Error retrieving data: $error");
    }
    return eventList;
  }

  void check() async {
    log("R_Event_Details:");
    printEventDetailsList(R_Event_details);
    // log("Inside Check");
    List<Event> Event_details = await fetchEventData();

    log("Event_Details:");
    printEventDetailsList(Event_details);

    // use awaitwithf etchdata and async in parent since the data can be retrived in future
    // List<dynamic> finallist = Event_details;
    // //  finallist.addAll(Event_details);
    // String listStr = finallist.toString();
    // log("final list is:$listStr");
    // log("Printing individual event details:");

//       String jsonData = jsonEncode(finallist);
    for (int i = 0; i < Event_details.length; i++) {
      if (Event_details[i] != R_Event_details[i]) {
        log("Mismatch at index $i:");
        log("Event_details[$i]: ${Event_details[i]}");
        log("R_Event_details[$i]: ${R_Event_details[i]}");
      }
    }

    try {
      if (listEquals(Event_details, R_Event_details)) {
        log("Database Successfully Synced");
      } else {
        log("Check the Operations");
      }
    } catch (e) {
      log("$e");
    }
  }
}
