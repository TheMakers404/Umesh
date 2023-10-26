class Event {

  const Event({
    required this.id,
     required this.type,
    required this.categories,
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.college_name,
    required this.about_event_title,
    required this.about_event_content,
    required this.price,
    required this.location,
  });

  final String id;
  final List<String> type;
  final String categories;
  final String date;
  final String title;
  final String imageUrl;
  final String time;
  final String college_name;
  final String about_event_title;
  final String about_event_content;
  final int price;
  final String location;
}

class EventData {
  //static final faker = Faker();
  static final List<Event> Event_details = [];
    
 }
