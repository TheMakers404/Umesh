
// import 'package:campusbuzz/model/event.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class Fav_list extends StatefulWidget {
//   const Fav_list(
//       {super.key,
//       required this.event,
//       required this.onselectevent,
//      });

//   final Event event;

//   final void Function(Event event) onselectevent;

//   @override
//   State<Fav_list> createState() => _Fav_listState();
// }

// class _Fav_listState extends State<Fav_list> {




//   @override
//   Widget build(BuildContext context,) {
//     // final favoriteEvents = ref.watch(favoriteEventsProvider);

//     // final isFavorite = favoriteEvents.contains(event);

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//             Column(
//               children: [
//                 //event 1
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Container(
//                     height: 290,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
                      
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.7),
//                           spreadRadius: -4,
//                           blurRadius: 11,
//                           offset: Offset(0, 9), // changes position of shadow
//                         ),
//                       ],
                      
                      
                      
//                       //border: Border.all(color: Colors.black, width: 0.2),
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(0),
//                       child: InkWell(
//                         onTap: () {
//                           widget.onselectevent(widget.event);
//                         },
                        
//                           child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
                            
//                             width: 370,
//                             height: 200,
//                             child: Stack(
//                               children: [
                                
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                               topRight: Radius.circular(15)),
//                                   child: Hero(
//                                     tag: 'eventImage_${widget.event.id}',
//                                     child: 
//                                     // Image.network(
//                                     //   event.imageUrl,
//                                     //   width: 370,
//                                     //   height: 200,
//                                     //   fit: BoxFit.cover,
//                                     // ),
//                                     Stack(
//     children: [
//       ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//         child: Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: Container(
//             width: 370,
//             height: 200,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//         child: Image.network(
//           widget.event.imageUrl,
//           width: 370,
//           height: 200,
//           fit: BoxFit.cover,
//         ),
//       ),
//     ],
//   ),
//                                   ),
//                                 ),
//                                 Column(
//                                   children: [
//                                     Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 10, right: 10),
//                                         child: CircleAvatar(
                                  
//                                           backgroundColor: Colors.white,
//                                           child:Container(
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.7),
//                           spreadRadius: -11,
//                           blurRadius: 11,
//                           offset: Offset(0, 9), // changes position of shadow
//                         ),
//                       ],
                                  
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: InkWell(
//                                   onTap: () {
                                    
//                                   },
//                                   child:  Padding(
//                                     padding: EdgeInsets.all(5.0),
//                                     // child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined,color: Colors.red,)
//                                     child: Icon(Icons.favorite)
                                        
//                                   ),
//                                 ),
//                               ),
                                          
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           //event info

//                           const SizedBox(
//                             height: 8,
//                           ),

//                           SizedBox(
//                             child: Column(
//                               children: [
//                                 Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Padding(
//                                     padding: EdgeInsets.only(left: 7),
//                                     child: Text(
//                                       widget.event.title,
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.w800),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 6,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 7),
//                                   child: SizedBox(
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.calendar_today_outlined,
//                                           size: 15,
//                                           color: Color(0xff646464),
//                                         ),
//                                         SizedBox(
//                                           width: 4,
//                                         ),
//                                         Text(
//                                           widget.event.date,
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w300,color: Color(0xff646464)),
//                                         ),
//                                         SizedBox(
//                                           width: 35,
//                                         ),
//                                         Icon(
//                                           Icons.watch_later_outlined,
//                                           size: 15,
//                                           color: Color(0xff646464),
//                                         ),
//                                         Text(
//                                           widget.event.time,
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w300,color: Color(0xff646464),),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 6,),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left:6.0),
//                                       child: Icon(Icons.location_on_outlined,size: 15,color: Color(0xff646464),),
//                                     ),
//                                     SizedBox(width: 4,),
//                                     Text(widget.event.college_name,style: TextStyle(
//                                               fontSize: 13,
//                                               color: Color(0xff646464),
//                                               fontWeight: FontWeight.w300),)
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       )),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
          
//         ],
//      ),
// );
// }
// }