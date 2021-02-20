import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  String id;
  String status;
  String image;

  Status({this.id, this.status, this.image});

  factory Status.fromSnapshot(DocumentSnapshot snapshot) {
    return Status(
      id: snapshot.id,
      status: snapshot["status"],
      image: snapshot["image"],
    );
  }
}
