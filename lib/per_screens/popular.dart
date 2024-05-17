import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';

class EventItemm2 extends StatelessWidget {
  final Event event;
  final void Function(Event event) onselectevent;

  const EventItemm2({super.key, required this.event, required this.onselectevent});

  @override
  Widget build(BuildContext context) {

    // final provider= Provider.of<Favoriteprovider>(context);
    // final favoriteEvents = ref.watch(favoriteEventsProvider);

    // final isFavorite = favoriteEvents.contains(event);
    return Padding(
      padding: const EdgeInsets.only(left: 15,bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -4,
                        blurRadius: 11,
                        offset: const Offset(0, 10), // changes position of shadow
                      ),
                    ],
        //border: Border.all(color: Colors.black, width: 0.1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: InkWell(
              //insted of inkwell using GestureDetector
              onTap: () {
                onselectevent(event);
              }, //for navigations or any other function
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 210,
                    height: 138,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          child: Hero(
                            tag: 'eventImage_${event.title}_s',
                            child: Image.network(
                              event.imageUrl,
                              width: 210,
                              height: 138,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -4,
                        blurRadius: 11,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                                      borderRadius: BorderRadius.circular(50)),
                                  child: InkWell(
                                    onTap: () {

                                      // provider.togglefav(event);
                                      // Add your onPressed function here
                                      // print('Icon pressed');
                                      // print('Icon pressed');
                                      // final wasAdded = ref
                                      //     .read(favoriteEventsProvider.notifier)
                                      //     .toggleEventFavoriteStatus(event);
                                      // ScaffoldMessenger.of(context)
                                      //     .clearSnackBars();
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   SnackBar(
                                      //     content: Text(wasAdded
                                      //         ? 'Event added as a favorite.'
                                      //         : 'Event removed.'),
                                      //   ),
                                      // );

                                      // widget.onToggleFavorite(event);
                                    },
                                    child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                        
                                          Icons.favorite
                                        
                                   
                                         
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  //event info

                  const SizedBox(
                    height: 8,
                  ),

                  SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 5),
                          child: Text(
                            event.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 3),
                          child: SizedBox(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  event.date,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  width: 28,
                                ),
                                const Icon(
                                  Icons.watch_later_outlined,
                                  size: 15,
                                ),
                                Text(
                                  event.time,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}




//accept and deny function 



// class Hack extends StatefulWidget {
//   const Hack({Key? key}) : super(key: key);

//   @override
//   _HackState createState() => _HackState();
// }

// class _HackState extends State<Hack> {
//   bool hackStatus = false;

//   // Function to update the hack field in Firestore
//   Future<void> updateHackStatus(bool status) async {
//     try {
//       await FirebaseFirestore.instance.collection('User').doc('LkZjeaqLCPEq191om8qa').update({
//         'hack': status,
//       });
//       setState(() {
//         hackStatus = status;
//       });
//       print('Hack status updated successfully!');
//     } catch (error) {
//       print('Error updating hack status: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Hack Testing")),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('User').doc('LkZjeaqLCPEq191om8qa').get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Text('Document not found');
//           }

//           String name = snapshot.data!['Leader Name'] ?? 'Name not found';

//           return Column(
//             children: [
//               Text("Name: $name"),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Accept button pressed, update hack field to true
//                   updateHackStatus(true);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: hackStatus ? Colors.green : null,
//                 ),
//                 child: Text("Accept"),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   // Deny button pressed, update hack field to false
//                   updateHackStatus(false);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: hackStatus ? null : Colors.red,
//                 ),
//                 child: Text("Deny"),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }




//proper working accept and deny

// class Hack extends StatefulWidget {
//   const Hack({Key? key}) : super(key: key);

//   @override
//   State<Hack> createState() => _HackState();
// }

// class _HackState extends State<Hack> {
//   bool? _currentHackStatus; // Initialize as null

//   // Function to update the hack field in Firestore
//   Future<void> updateHackStatus(bool status) async {
//     try {
//       await FirebaseFirestore.instance.collection('User').doc('LkZjeaqLCPEq191om8qa').update({
//         'hack': status,
//       });
//       setState(() {
//         _currentHackStatus = status;
//       });
//       print('Hack status updated successfully!');
//     } catch (error) {
//       print('Error updating hack status: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Hack Testing")),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('User').doc('LkZjeaqLCPEq191om8qa').get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Text('Document not found');
//           }

//           if (_currentHackStatus == null) {
//             // Set _currentHackStatus only if it's not set yet
//             _currentHackStatus = snapshot.data!['hack'];
//           }

//           bool hackStatus = _currentHackStatus ?? false;
//           String name = snapshot.data!['Leader Name'] ?? 'Name not found';

//           return Column(
//             children: [
//               Text("Name: $name"),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   updateHackStatus(true);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: hackStatus ? Colors.green : null,
//                 ),
//                 child: Text("Accept"),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   updateHackStatus(false);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: hackStatus ? null : Colors.red,
//                 ),
//                 child: Text("Deny"),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }