import 'package:campusbuzz/model/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteEventsNotifier extends StateNotifier<List<Event>> {
  FavoriteEventsNotifier() : super([]);

  bool toggleEventFavoriteStatus(Event event) {
    final eventIsFavorite = state.contains(event);

    if (eventIsFavorite) {
      state = state.where((m) => m.id != event.id).toList();
      return false;
    } else {
      state = [...state, event];
      return true;
    }
  }
}

final favoriteEventsProvider =
    StateNotifierProvider<FavoriteEventsNotifier, List<Event>>((ref) {
  return FavoriteEventsNotifier();
});


