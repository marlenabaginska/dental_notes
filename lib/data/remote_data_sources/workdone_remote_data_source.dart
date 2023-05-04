import 'package:cloud_firestore/cloud_firestore.dart';

class WorkdoneRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> workdone() {
    return FirebaseFirestore.instance.collection('workdone').snapshots();
  }

  Future<void> addWorkdone(
    date,
    doctor,
    patient,
    quantity,
    color,
    type,
    teeth,
  ) {
    return FirebaseFirestore.instance.collection('workdone').add({
      'date': date,
      'doctor': doctor,
      'patient': patient,
      'quantity': quantity,
      'color': color,
      'type': type,
      'teeth': teeth,
    });
  }
}
