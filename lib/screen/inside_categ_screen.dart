import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event,required this.onSelectEvent,});

  final Event event;
   //final void Function(Event event) onToggleFavorite;
   final void Function(Event event) onSelectEvent;
  //  final void Function(Event event) onToggleFavorite;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
           onSelectEvent(event);
          
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(event.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black45,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      event.title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // Very long text ...
                      style: const TextStyle(
                        fontSize:15,
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
  }
}
