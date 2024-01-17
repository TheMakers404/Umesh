// import 'package:campusbuzz/event_detail_screen.dart';
// import 'package:campusbuzz/explore_page/fav_page.dart';
// import 'package:campusbuzz/model/event.dart';
// import 'package:flutter/material.dart';

// class Fav extends StatelessWidget {
//   const Fav({
//     super.key,
//     this.title,
//     required this.event,
//   });

//   final String? title;
//   final List<Event> event;
//   // final void Function(Event event) onToggleFavorite;

//   void selectEvent(BuildContext context, Event event) {
//     //Navigator.of(context).pop(); //not required
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => EventDetailScreen(
//           event: event,
//           // onToggleFavorite: onToggleFavorite,
//         ),
//       ),
//     );
//   }

//   // final CollectionReference events =
//   //     FirebaseFirestore.instance.collection('events');

//   @override
//   Widget build(BuildContext context) {
//     Widget content = const Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Uh oh ... nothing here!',
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xffE93030))),

//           const SizedBox(height: 16),
//           // Text(
//           //   'Try selecting a different category!',
//           //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//           //         color: Theme.of(context).colorScheme.onBackground,
//           //       ),
//           // ),
//         ],
//       ),
//     );

//     if (event.isNotEmpty) {
//       content = ListView.builder(
//           itemCount: event.length,
//           itemBuilder: (ctx, index) => Fav_list(
//                 event: event[index],
//                 onselectevent: (event) {
//                   selectEvent(context, event);
//                 },
//                 // onToggleFavorite: onToggleFavorite,
//               ));
//     }

//     if (title == null) {
//       return content;
//     }
//     return Scaffold(
      
//       backgroundColor: Color(0xfff5f5f5),
//       body: SafeArea(
//         child: NestedScrollView(
          
//           //floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               floating: true,
//               snap: true,
//               toolbarHeight: 70,
//               title: Center(
//                 child: Column(
//                   children: [
//                     // Text(
//                     //   title!,
//                     //   style: TextStyle(
//                     //     fontSize: 25,
//                     //     fontWeight: FontWeight.w800,
//                     //     color: Color(0xffE93030),
//                     //   ),
//                     // ),
//                     // SizedBox(height: 10,),
      
//                     //search bar
      
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color(0xfff5f5f5),
//                           borderRadius: BorderRadius.circular(15.5),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.7),
//                               spreadRadius: -11,
//                               blurRadius: 11,
//                               offset: Offset(0, 9), // changes position of shadow
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 3),
//                           child: TextFormField(
//                             decoration: const InputDecoration(
//                                 contentPadding: EdgeInsets.only(top: 14),
//                                 border: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                                 hintText: 'Search for events...',
//                                 hintStyle: TextStyle(color: Color(0xff939393)),
//                                 prefixIcon: Icon(
//                                   Icons.search_rounded,
//                                   color: Color(0xff858585),
//                                   size: 30,
//                                 ),
//                                 suffixIcon: Icon(
//                                   Icons.mic,
//                                   color: Color(0xff525252),
//                                   size: 30,
//                                 )),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               backgroundColor: Color.fromARGB(255, 255, 255, 255),
//               elevation: 5,
//             ),
//           ],
//           body: content,
//         ),
//       ),
//     );
//   }
// }


  