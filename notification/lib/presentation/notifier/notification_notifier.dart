import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationNotifier extends StateNotifier<List<String>> {
  NotificationNotifier() : super([]);

  void addNotification(String body) => state = [...state, body];
}

final StateNotifierProvider<NotificationNotifier, List<String>> 
notificationsProvider = StateNotifierProvider((ref) => NotificationNotifier());