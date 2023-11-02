import 'package:campusbuzz/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final eventListProvider = StateNotifierProvider<EventListNotifier, List<Evvent>>((ref) {
  return EventListNotifier();
});

class EventListNotifier extends StateNotifier<List<Evvent>> {
  EventListNotifier() : super([]);

  void addEvent(Evvent event) {
    state = [...state, event];
  }
}
