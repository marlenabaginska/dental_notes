import 'package:cloud_firestore/cloud_firestore.dart';

class WorkdoneModel {
  final DateTime date;
  final String doctor;
  final String patient;
  final int quantity;
  final String color;

  final String teeth;
  final String type;

  const WorkdoneModel({
    required this.date,
    required this.doctor,
    required this.patient,
    required this.quantity,
    required this.color,
    required this.teeth,
    required this.type,
  });

  WorkdoneModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> workdone)
      : date = workdone['date'],
        doctor = workdone['doctor'],
        patient = workdone['patient'],
        quantity = workdone['quantity'],
        color = workdone['color'],
        teeth = workdone['teeth'],
        type = workdone['type'];
}
