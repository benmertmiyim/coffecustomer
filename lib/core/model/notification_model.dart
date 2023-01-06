import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String title;
  final String id;
  final String message;
  final DateTime sendedDate;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.sendedDate,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      id: map['id'] as String,
      message: map['message'] as String,
      sendedDate: (map['sendedDate'] as Timestamp).toDate(),
    );
  }
}
