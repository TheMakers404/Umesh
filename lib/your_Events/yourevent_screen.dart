import 'package:campusbuzz/model/event.dart';
import 'package:campusbuzz/token.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class YourEvents extends StatelessWidget {
  const YourEvents({
    super.key,
    required this.title,
    required this.imageUrl, required this.time, required this.date, required this.collegeName, required this.token, required this.leaderName,

  });

  final String title;
  final String imageUrl;
  final String time;
  final String date;
  final String collegeName;
  final String token;
  final String leaderName;

  void selectEvent(BuildContext context, Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => TokenDisplayScreen(
          imageUrl: imageUrl,
          title: title,
          token: '',
          time: '',
          date: '',
          college_name: '',
          leaderName: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Text('Uh oh ... nothing here!!',
                style: TextStyle(color: Color.fromARGB(255, 218, 17, 17))),
          ),
        ],
      ),
    );

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: imageUrl.length,
        itemBuilder: (context, index) {
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
                            token: token,
                            imageUrl: imageUrl,
                            time: time,
                            date: date,
                            title: title,
                            leaderName: leaderName,
                            college_name: collegeName,
                          )),
                );
              },
              child: Stack(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: AssetImage(imageUrl),
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
                            title,
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
      ),
    );
  }
}
