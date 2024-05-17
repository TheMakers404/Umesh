import 'package:flutter/material.dart';

import 'detail_page.dart';

class AllCategoryItems extends StatelessWidget {
  const AllCategoryItems( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),

              const Padding(
                padding:EdgeInsets.all(10),
              child:Column(children: [
                Text('Explore',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Color(0xffE93030)),)
              ],)
              ),

              const SizedBox(
                height: 10,
              ),
              //search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(23.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search anything...',
                        hintStyle: TextStyle(color: Color(0xffC7C7C7)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffc7c7c7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),


              //event 1
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: GestureDetector(
                        //insted of inkwell using GestureDetector
                        onTap: () {
                          print("event pressed");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail()));
                        }, //for navigations or any other function
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 370,
                              height: 200,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.asset(
                                        'images/event.jpg',
                                        width: 370,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    
                                  ),
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: InkWell(
                                              onTap: () {
                                                // Add your onPressed function here
                                                print('Icon pressed');
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(Icons.favorite,
                                                    color: Color(0xffF81B1B),
                                                    size: 22),
                                              ),
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

                            const SizedBox(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Text(
                                        'Aquila Fest 2023',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Oct 18 2023",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Icon(
                                            Icons.watch_later_outlined,
                                            size: 20,
                                          ),
                                          Text(
                                            "08:30 PM",
                                            style: TextStyle(
                                                fontSize: 18,
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
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}