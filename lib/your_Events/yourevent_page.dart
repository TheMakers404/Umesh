
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Epage extends StatelessWidget {
  const Epage({super.key,});


   //final void Function(Event event) onToggleFavorite;
   
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
           
          
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage("event"),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Column(
              children: [
                
              ],
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
                      "event.title",
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
