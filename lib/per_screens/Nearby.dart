import 'package:cached_network_image/cached_network_image.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';



class EventItemm extends StatelessWidget {
  final Event event;
  final void Function(Event event) onselectevent;

  const EventItemm({super.key, required this.event, required this.onselectevent});

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
                  SizedBox(
                    width: 210,
                    height: 138,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          child: Hero(
                            tag: 'eventImage_${event.id}',
                            child: 
                            Stack(
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 210,
            height: 138,
            color: Colors.white,
          ),
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: 
        // Image.network(
        //   event.imageUrl,
        //   width: 210,
        //   height: 138,
        //   fit: BoxFit.cover,
        // ),
        CachedNetworkImage(
        imageUrl: event.imageUrl,
        width: 210,
        height: 138,
        fit: BoxFit.cover,
        //placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
     ),
      ),
    ],
  ),
        //                     CachedNetworkImage(
        //   imageUrl: "event.imageUrl",
        //   placeholder: (context, url) => CircularProgressIndicator(),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        //   width: 210,
        //   height: 138,
        //   fit: BoxFit.cover,
        // ),
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
                                          // provider.isExist(event)
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
                        ),

                        
                      ],
                    ),
                  ),
                  
                ],
              )),
        ),
      ),
    );
  }
}
