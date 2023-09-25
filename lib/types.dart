import 'package:cloud_firestore/cloud_firestore.dart';

class Test
{
    String id;
    String subject;
    Timestamp date;
    
    Test(this.id, this.subject, this.date);
}