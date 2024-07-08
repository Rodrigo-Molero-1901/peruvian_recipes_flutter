import 'package:cloud_firestore/cloud_firestore.dart';

extension JsonFormatter on QueryDocumentSnapshot {
  Map<String, dynamic> get toJson => data() as Map<String, dynamic>;
}

extension JsonListFormatter on QuerySnapshot {
  List<Map<String, dynamic>> get toJsonList =>
      docs.map((doc) => doc.toJson).toList();
}
