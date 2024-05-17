import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:campusbuzz/screen/inside_categ_screen.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({
    super.key,
    required this.Ctitle,
    required this.events,
  });

  final String Ctitle;
  final List<Event> events;
  // final void Function(Event event) onToggleFavorite;

  void selectEvent(BuildContext context, Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EventDetailScreen(
          event: event,
          // onToggleFavorite: onToggleFavorite,
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
            child: Text('Uh oh ... nothing here!',
                style: TextStyle(color: Color.fromARGB(255, 218, 17, 17))),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (events.isNotEmpty) {
      content = GridView.builder(
        itemCount: events.length,
        itemBuilder: (ctx, index) => EventItem(
          event: events[index],
          onSelectEvent: (event) {
            selectEvent(context, event);
          },
          //  onToggleFavorite:onToggleFavorite,
        ),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Ctitle,
          style: const TextStyle(
            color: Color(0xffe93030),
          ),
        ),
        backgroundColor: const Color(0xfff5f5f5),
        leading: const BackButton(
          color: Color(0xffe93030),
        ),
        elevation: 0,
      ),
      body: content,
    );
  }
}
