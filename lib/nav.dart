// import 'package:campusbuzz/CampusBuzz%20Intro%20Screens/CampusBuzz%20Intro%20Screens/createaccount.dart';
// import 'package:campusbuzz/CampusBuzz%20Intro%20Screens/CampusBuzz%20Intro%20Screens/main.dart';
// import 'package:campusbuzz/CampusBuzz%20Intro%20Screens/CampusBuzz%20Intro%20Screens/welcomeback.dart';
import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/event_explore_screen/explore_screen.dart';
import 'package:campusbuzz/homescreen.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:campusbuzz/profile/profile_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'event_list.dart';



class TabsScreen extends StatefulWidget {


  const TabsScreen({super.key});

  

  @override
 State<TabsScreen> createState() {

    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {

  
  

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  //defin
  List<Widget> activePage = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
    PageController pageController = PageController();
    void _onItemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }

  int _selectedPageIndex = 0;
  @override

  Widget build(BuildContext context) {
    
    // final favoriteEvent = ref.watch(favoriteEventsProvider);
    // final favlist= Provider.of<Favoriteprovider>(context);
    // final events=favlist.events;
    // favoriteEventsNotifier.loadFavoriteEventsFromFirestore();
     activePage = [
       Homescreen(event: Event_details, onselectevent: (Event event) {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailScreen(event: event, ),
        ),
      );
        },),
      Explore(
        title: 'Explore',
        event: Event_details,
       
      ),
      Explore(
        event: Event_details,
        title: 'Favorites',
        
      ),
      const Profile(),
    ];
    return Scaffold(
        body: PageView(
        controller: pageController,
        onPageChanged: _selectPage,
        children: activePage,
      ),
          bottomNavigationBar:
          //changed here
          Container(
            decoration: BoxDecoration(
              boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3), // Shadow color
          spreadRadius: 1, // Spread radius
          blurRadius: 13, // Blur radius
          offset: const Offset(0, 0), // Offset in the x and y directions
        ),
      ],
            ),
            child: BottomNavigationBar(
                  currentIndex: _selectedPageIndex,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: const Color.fromARGB(255, 54, 46, 46),
                  // backgroundColor: Colors.black,
                  selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  onTap: _onItemTapped,
                  items: [
              BottomNavigationBarItem(
                
                icon: _selectedPageIndex == 0
            ? const Icon(
                Icons.home,
                size: 35,
              )
            : const Icon(
                Icons.home_outlined,
                size: 35,
              ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _selectedPageIndex == 1
            ? Icon(
                MdiIcons.compass,
                size: 35,
              )
            : Icon(
                MdiIcons.compassOutline,
                size: 35,
              ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: _selectedPageIndex == 2
            ? const Icon(
                Icons.favorite,
                size: 35,
              )
            : const Icon(
                Icons.favorite_border_rounded,
                size: 35,
              ),
                label: 'Liked',
              ),
              BottomNavigationBarItem(
                icon: _selectedPageIndex == 3
            ? const Icon(
                Icons.person,
                size: 35,
              )
            : const Icon(
                Icons.person_outline,
                size: 35,
              ),
                label: 'Profile',
              ),
            ],
                  type: BottomNavigationBarType.fixed,
                ),
          ),
    );
  }
}