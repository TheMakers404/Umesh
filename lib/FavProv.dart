// import 'package:campusbuzz/model/event.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class FavoriteEventsNotifier extends StateNotifier<List<Event>> {
//   FavoriteEventsNotifier() : super([]);

//   bool toggleEventFavoriteStatus(Event event) {
//     final eventIsFavorite = state.contains(event);

//     if (eventIsFavorite) {
//       state = state.where((m) => m.id != event.id).toList();
//       return false;
//     } else {
//       state = [...state, event];
//       return true;
//     }
//   }
// }

// final favoriteEventsProvider =
//     StateNotifierProvider<FavoriteEventsNotifier, List<Event>>((ref) {
//   return FavoriteEventsNotifier();
// });



import 'package:campusbuzz/model/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteEventsNotifier extends StateNotifier<List<Event>> {
  FavoriteEventsNotifier() : super([]);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool toggleEventFavoriteStatus(Event event) {
    final eventIsFavorite = state.contains(event);

    if (eventIsFavorite) {
      state = state.where((m) => m.id != event.id).toList();
      // Delete the corresponding document in Firestore
      _firestore.collection('favorite_events').doc(event.id).delete();
    } else {
      state = [...state, event];
      // Add a new document in Firestore
      _firestore.collection('favorite_events').doc(event.id).set({
        'id': event.id,
        'name': event.title,
        // Add other event properties as needed
      });
    }

    return !eventIsFavorite;
  }
}

final favoriteEventsProvider =
    StateNotifierProvider<FavoriteEventsNotifier, List<Event>>((ref) {
  return FavoriteEventsNotifier();
});


//testing #1
// import 'package:campusbuzz/model/event.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class FavoriteEventsNotifier extends StateNotifier<List<Event>> {
//   FavoriteEventsNotifier() : super([]);

//   final CollectionReference favoriteEventsCollection =
//       FirebaseFirestore.instance.collection('favoriteEvents'); // Replace with your Firestore collection name

//   Future<void> toggleEventFavoriteStatus(Event event) async {
//     final eventIsFavorite = state.contains(event);

//     if (eventIsFavorite) {
//       state = state.where((m) => m.id != event.id).toList();
//       await favoriteEventsCollection.doc(event.id).delete();
//     } else {
//       state = [...state, event];
//       await favoriteEventsCollection.doc(event.id).set(event.toMap());
//     }
//   }
// }

// final favoriteEventsProvider =
//     StateNotifierProvider<FavoriteEventsNotifier, List<Event>>((ref) {
//   return FavoriteEventsNotifier();
// });
