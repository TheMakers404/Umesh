import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
_launchurl() async {
  var url = Uri.parse("https://goo.gl/maps/gFc3LskeRs3zJ82V9");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Cannot launch URL';
  }
}
// ignore: must_be_immutable
class Detail extends StatelessWidget {
  Detail({super.key});

  String content =
      "here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 259,
                //image
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child:Image.asset(
                              'images/event.jpg',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 20),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  child: Icon(Icons.arrow_back_ios),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 155,
                            right: 15,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite,
                                color: Color(0xffF81B1B),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              //title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Aquila Fest 2023',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),

              //about title
              const SizedBox(
                height: 15,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "About Event",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),

              //date and time

              // SizedBox(
              //   height: 10,
              // ),
              // //date
              // const SizedBox(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15),
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.calendar_today_outlined,
              //                 size: 20,
              //               ),
              //               SizedBox(
              //                 width: 6,
              //               ),
              //               Text(
              //                 "Oct 18 2023",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.w300),
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),

              //         //time
              //         SizedBox(
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.watch_later_outlined,
              //                 size: 20,
              //               ),
              //               SizedBox(
              //                 width: 6,
              //               ),
              //               Text(
              //                 "08:30 PM",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.w300),
              //               ),
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              //about section content

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: ReadMoreText(
                  content,
                  trimLines: 5,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show More",
                  trimExpandedText: "Show Less",
                  lessStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF81B1B),
                  ),
                  moreStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF81B1B),
                  ),
                  style:
                      const TextStyle(fontWeight: FontWeight.w300, height: 1.5),
                ),
              ),

              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              //   child: Text('here will be a brief description about the above event long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.',
              //   style: TextStyle(fontWeight:FontWeight.w300 ),),
              // )
              const SizedBox(
                height: 15,
              ),

              //date and time

               Container(
                child: Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: (){},

                              child:const  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 235,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                            
                                      children: [
                                        Text(
                                          "Monday, Oct 19, 2023",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 1.5,
                                        ),
                                        Text(
                                          "8:30 PM - 11:30 PM",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8D8D8D)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Icon(Icons.arrow_forward_ios,),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    const  Divider(
                        thickness: 1,
                      ),
                 const  SizedBox(
                        height: 7,
                      ),

                      //location

                    GestureDetector(
                       onTap: (){
                                  _launchurl();
                                },
                      child: Container( 
                    
                        child: const SizedBox(
                          child: Row(
                            children: [
                           Icon(
                                Icons.location_on_outlined,
                                size: 40,
                              ),
                            SizedBox(
                                width: 20,
                              ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 235,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                                      children: [
                                        Text(
                                          "St.Peter’s College,",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 1.5,
                                        ),
                                        Text(
                                          "maisammaguda",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8D8D8D)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                               
                                child:Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ),
                    ),
                 const   SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),

              //buy button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MaterialButton(
                  color: const Color(0xff112031),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register Now",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Event2 extends StatelessWidget {
  const Event2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('images/music.jpg'),
    );
  }
}

