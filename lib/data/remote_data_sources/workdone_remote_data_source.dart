import 'package:cloud_firestore/cloud_firestore.dart';

class WorkdoneRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> workdone() {
    return FirebaseFirestore.instance.collection('workdone').snapshots();
  }
}
