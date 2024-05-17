import 'package:campusbuzz/categories.dart';
import 'package:campusbuzz/data/category_list.dart';
import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/location/location.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:campusbuzz/per_screens/Nearby.dart';
import 'package:campusbuzz/per_screens/popular.dart';
import 'package:campusbuzz/provider/banner.dart';
import 'package:campusbuzz/screen/category_screen.dart';
import 'package:campusbuzz/search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event_list.dart';


class Homescreen extends StatefulWidget {
  const Homescreen(
      {super.key,
      required this.event,
      required this.onselectevent});
  final String url = 'https://www.example.com'; // Replace with your URL

  final List<Event> event;
  final void Function(Event event) onselectevent;

  // final void Function(Event event) onToggleFavorite;
//category
  void _selectCategory(BuildContext context, Categori categori) {
    final filteredEvents =
        Event_details.where((evnt) => evnt.categories.contains(categori.id))
            .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EventScreen(
          Ctitle: categori.Ctitle,
          events: filteredEvents,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  State<Homescreen> createState() {
    return _HomescreenState();
  }
}

bool showAllItems = false;

class _HomescreenState extends State<Homescreen> {
  //  NotificationServices notificationServices = NotificationServices();

  Widget _buildDivider() {
  return const Padding(
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'Nearby Events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color:  Color.fromARGB(202, 17, 32, 49),
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}
 Widget _buildDivider2() {
  return const Padding(
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'Popular Events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color:  Color.fromARGB(202, 17, 32, 49),
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

  List imageList = [
    {"id": 4, "image_path": 'images/b1.jpeg'},
    {"id": 2, "image_path": 'images/event1.jpg'},
    {"id": 3, "image_path": 'images/event3.png'},
    {"id": 1, "image_path": 'images/event5.webp'}
  ];
  //category stuff

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  

  Future<void> _refreshData() async {
    // Add the logic to reload data here
    // For example, you might fetch new data from the server
    // or update the existing data
    // For now, let's just simulate a delay using Future.delayed
    await Future.delayed(const Duration(seconds: 2));
    // Set the new data
    setState(() {
      // Update your data here
      // Example: widget.event = fetchNewData();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("homepage build");
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.hasPrimaryFocus) ;
        currentFocus.unfocus();
      },
      child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Row(
                    
                    //top bar
          
                    children: [

                      const Text(" Hello, ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      const Text("Umesh!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.red),),
                      const Spacer(),
                      // Image.asset(
                      //   'svg/realloaction.png',
                      //   width: 25,
                      // ),
                      // SizedBox(
                      //   width: 4,
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.only(bottom: 0),
                      //   child: Column(
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.only(right: 70.0),
                      //         child: Row(
                      //           children: [
                      //             Text('New bowenaplly ',
                      //                 style: TextStyle(
                      //                     fontSize: 15,
                      //                     fontWeight: FontWeight.w600,color: Color.fromARGB(195, 0, 0, 0)),
                      //                     textScaleFactor: 1.2,),
                      //             Icon(Icons.keyboard_arrow_down_rounded),
                      //           ],
                      //         ),
                      //       ),
                      //       Text(
                      //         'vijaya mansion,plot no 52,jayanagar colony  ',
                      //         style: TextStyle(
                      //             fontSize: 10, fontWeight: FontWeight.w400,color: Colors.black87),
                      //         //textAlign: TextAlign.center,
                      //         textScaleFactor: 1.2,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          // final results = showSearch(context:context, delegate: DtSearch());
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyForm(),
                                ));
                          print("bell icon tapped");
                        },
                        
                            
                              child: const Icon(
                                Icons.notifications_none,
                                size: 30,
                              ),
                             //Image.asset('svg/bell_3.png', width: 25),
              
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(15.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: -11,
                          blurRadius: 11,
                          offset: const Offset(0, 9), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        final results = showSearch(context:context, delegate: DtSearch());
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Stack(
                          children: [
                            Container(
                              height: 40,
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top:5.0,left: 5),
                              child: Icon(
                                Icons.search_rounded,
                                color: Color(0xff858585),
                                size: 30,
                              ),
                            ),
                            const Positioned(left: 50,top: 7,child:Text("search for event...",style: TextStyle(color: Color(0xff939393),fontSize: 17),), )
                            
                          ],
                          // decoration: InputDecoration(
                          //     contentPadding: EdgeInsets.only(top: 14),
                          //     border: InputBorder.none,
                          //     focusedBorder: InputBorder.none,
                          //     hintText: 'Search for events...',
                          //     hintStyle: TextStyle(color: Color(0xff939393)),
                          //     prefixIcon: Icon(
                          //       Icons.search_rounded,
                          //       color: Color(0xff858585),
                          //       size: 30,
                          //     ),
                          //     suffixIcon: Icon(
                          //       Icons.mic,
                          //       color: Color(0xff525252),
                          //       size: 30,
                          //     )),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
          
                //category
          
                SizedBox(
                  height: 105,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (final categori in AvailableCategories)
                        Categ(
                          categori: categori,
                          onSelectCategory: () {
                            widget._selectCategory(context, categori);
                          },
                        )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
          
                //running banner
          
                Column(
                  
                  children: [
                    InkWell(
                      onTap: () {
                        print(currentIndex);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Forms()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: -4,
                          blurRadius: 11,
                          offset: const Offset(0, 9), // changes position of shadow
                        ),
                      ],
                        ),
                        child: Consumer<BannerProvider>(

                           builder: (context, bannerProvider, _) { 
                            print("Running Banner");
                            return CarouselSlider(
                            items: imageList
                                .map(
                                  (item) => Container(
                                    decoration: const BoxDecoration(
                                      
                                    ),
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        item['image_path'],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              aspectRatio: 2,
                              viewportFraction: 0.93,
                              enlargeCenterPage: true, //added
                              enlargeStrategy:
                                  CenterPageEnlargeStrategy.height, //added
                                                
                              onPageChanged: (index, reason) {
                                context.read<BannerProvider>().updateCurrentIndex(index);
                                  currentIndex = index;
                                
                              },
                            ),
                          );
                            }
                           
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                      ? const Color.fromARGB(255, 189, 29, 29)
                                      : const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
          
                //nearby events title
                const SizedBox(
                  height: 10,
                ),
                _buildDivider(),
                const SizedBox(
                  height: 15,
                ),
          
                //nearby events list
                Container(
                  decoration: const BoxDecoration(
                    //color: Colors.amber,gradient: LinearGradient(colors: Colors.accents)                
                    ),
                  
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.event.length,
                    itemBuilder: (ctx, index) {
                      final eventItem = widget.event[index];
                      return EventItemm(
                        event: eventItem,
                        onselectevent: (event) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailScreen(
                                event: event,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
          
                //popular events title
          
                const SizedBox(
                  height: 5,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 6.0),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 5,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(top: 5.0),
                //         child: Container(
                //           width: 95,
                //           height: 1,
                //           color: Color.fromARGB(139, 158, 158, 158),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 7,
                //       ),
                //       const Padding(
                //         padding: EdgeInsets.only(left: 2),
                //         child: Text(
                //           'Popular Events',
                //           style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.w700,
                //               color: Color.fromARGB(202, 17, 32, 49)),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 8,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(top: 5.0),
                //         child: Container(
                //           width: 90,
                //           height: 1,
                //           color: Color.fromARGB(139, 158, 158, 158),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 5,
                //       ),
                //     ],
                //   ),
                // ),
                _buildDivider2(),
                const SizedBox(
                  height: 15,
                ),
          
                //popluar events
                Container(
                  decoration: const BoxDecoration(
                    //color: Colors.amber,gradient: LinearGradient(colors: Colors.accents)                
                    ),
                  
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.event.length,
                    itemBuilder: (ctx, index) {
                      final eventItem = widget.event[index];
                      return EventItemm2(
                        event: eventItem,
                        onselectevent: (event) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailScreen(
                                event: event,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
          
                // SizedBox(
                //   height: 230,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: widget.event.length,
                //     itemBuilder: (ctx, index) {
                //       final eventItem = widget.event[index];
                //       return EventItemm(
                //         event: eventItem,
                //         onselectevent: (event) {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => EventDetailScreen(
                //                 event: event,
                //               ),
                //             ),
                //           );
                //         },
                //       );
                //     },
                //   ),
                // ),

                
                
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}