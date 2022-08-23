// ignore_for_file: avoid_print
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification/presentation/notifier/notification_notifier.dart';

class RerceivedNotificationPage extends ConsumerWidget {
  const RerceivedNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NotificationNotifier notificationNotifier = ref.watch(notificationsProvider.notifier);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      notificationNotifier.addNotification(message.data['body']);
    });
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification List"),
      ),
      body: Consumer(
        builder: (_, ref, __) {
          final List<String> notifList = ref.watch(notificationsProvider);
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: notifList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(notifList[index], maxLines: 2),
              );
            },
          );
        }
      ),
    );
  }
}
