import 'package:cloud_firestore/cloud_firestore.dart';

class Test
{
    String subject;
    DateTime startTime;
    DateTime endTime;
    
    Test({required this.subject, required this.startTime, required this.endTime});
}