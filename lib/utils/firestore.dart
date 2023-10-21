import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStore {
  late CollectionReference collectioName;

  void initialize() async {
    collectioName = FirebaseFirestore.instance.collection("chat-me-sara");
  }

  Stream<QuerySnapshot<Object?>> read() {
    return collectioName.snapshots();
  }

  Future<DocumentReference<Object?>> write(Map<String, dynamic> message) {
    return collectioName.add(message);
  }
}
