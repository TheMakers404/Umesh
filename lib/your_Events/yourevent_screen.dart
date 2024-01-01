import 'package:campusbuzz/token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class YourEvents extends ConsumerStatefulWidget {

 
  // final Eventt eevent;
final List<Evvent> events;
  // //adding ticket
  // final List<Ticket> ticket;
  
  
   YourEvents({
    super.key, required this.events,
    

  });

  @override
  ConsumerState<YourEvents> createState() => _YourEventsState(events: events);

  
}

class _YourEventsState extends ConsumerState<YourEvents> {
  final CollectionReference _events =
    FirebaseFirestore.instance.collection('events');
  //List<Evvent> events = [];
  List<Evvent> events ;
 _YourEventsState({required this.events});

    void addEvent(Evvent event) {
    setState(() {
      events.add(event);
    });
  }
  
  // void selectEvent(BuildContext context, Event event) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => TokenDisplayScreen(
  //         token: widget.eevent.token,
  //                           imageUrl: widget.eevent.imageUrl,
  //                           time: widget.eevent.time,
  //                           date: widget.eevent.date,
  //                           title: widget.eevent.title,
  //                           leaderName: widget.eevent.leaderName,
  //                           college_name: widget.eevent.collegeName,
  //       ),
  //     ),
  //   );
  // }
  

  @override
  Widget build(BuildContext context ) {

    
    //final eventList = ref.watch(eventListProvider);




    // if (title.isNotEmpty) {
    //   content = GridView.builder(
    //     itemCount: title.length,
    //     itemBuilder: (ctx, index) => Epage(

    //       //  onToggleFavorite:onToggleFavorite,
    //     ),
    //     gridDelegate:
    //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //   );
    // }
    return 
    Scaffold(
      appBar: AppBar(
        title: Text("Ticket"),
      ),
      body: 
      StreamBuilder(
        stream: _events.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
            return 
            GridView.builder(
          
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              //no of rows
          itemCount:streamSnapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final DocumentSnapshot documentSnapshot=streamSnapshot.data!.docs[index];
            // Evvent event = eventList[index];
            
            return Card(
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TokenDisplayScreen(
                              // token: widget.events.token,
                              // imageUrl: widget.events.imageUrl,
                              // time: widget.events.time,
                              // date: widget.events.date,
                              // title: widget.events.title,
                              // leaderName: widget.events.leaderName,
                              // college_name: widget.events.collegeName, 
                              event:Evvent(token: "token", imageUrl: "imageUrl", time: "time", date: "date", title: "title", leaderName: "leaderName", college_name: "college_name"), 
                            )),
                  );
                },
                child: Stack(
                  children: [
                    FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: AssetImage(documentSnapshot['imageUrl']),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Column(
                      children: [],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 44),
                        child: Column(
                          children: [
                            Text(
                              documentSnapshot['title'],
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow:
                                  TextOverflow.ellipsis, // Very long text ...
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            //const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
            
          }
          return const Center(
            child: Center(child: Text("Loading..",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.red),)),
          );
        },
        
      ),
    );
  }
}


