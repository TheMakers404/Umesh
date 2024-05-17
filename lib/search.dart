// search logic class 
import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/event_list.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';

class DtSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
              showSuggestions(context);
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, ''),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    // Implement your code to display search results here
    // Use 'query' to filter and display relevant results from the backend
    return Container(
      // Customize how you want to display search results
      child: Text('Search results for: $query'),
    );
  }

  @override
Widget buildSuggestions(BuildContext context) {
  return FutureBuilder<List<Event>>(
    future: gettingData(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const Center(child: CircularProgressIndicator());
        default:
          final events = snapshot.data;
          if (events == null || events.isEmpty) {
            return Container(
              height: 100,
              child: const Center(
                child: Text(
                  'No Matches Found.',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          }
          final searchQuery = query.toLowerCase();

          // Function to format text with the searched query in bold
          Widget formatText(String text, String query) {
            final queryIndex = text.toLowerCase().indexOf(query);
            if (queryIndex != -1) {
              final span = TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: text.substring(0, queryIndex),
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  TextSpan(
                    text: text.substring(queryIndex, queryIndex + query.length),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: text.substring(queryIndex + query.length),
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              );
              return RichText(text: span);
            } else {
              return Text(text, style: const TextStyle(color: Colors.grey, fontSize: 18));
            }
          }

          final searchResults = events.where((event) =>
            event.title.toLowerCase().contains(searchQuery) ||
            event.college_name.toLowerCase().contains(searchQuery)
          ).toList();

          if (searchResults.isEmpty) {
            return Container(
              height: 100,
              child: const Center(
                child: Text(
                  'No Matches Found.',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final result = searchResults[index];
              return ListTile(
                leading: Image.asset(
                  result.imageUrl,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                title: formatText(result.title, searchQuery),
                subtitle: formatText(result.college_name, searchQuery),
                onTap: () {
                  // Handle what happens when a suggestion is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => EventDetailScreen(event: result),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
}

}