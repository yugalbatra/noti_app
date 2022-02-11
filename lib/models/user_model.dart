import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noti_app/pages/splash_page.dart';

class NotiUser {
  final String uid;
  String name = 'User';
  String term = 'Jan April 2022';
  List subjects = ['PDSA', 'DBMS', 'SCOM', 'MAD1', 'ALL1'];

  NotiUser({required this.uid});

  Future<List> createUser() async {
    await notiUsers.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> tempData =
            documentSnapshot.data() as Map<String, dynamic>;
        name = tempData['name'];
        term = tempData['term'];
        subjects = tempData['subjects'];
        return subjects;
      } else {
        notiUsers.doc(uid).set({
          'name': name, // John Doe
          'term': term, // Stokes and Sons
          'subjects': subjects, // 42
        });
        return subjects;
      }
    });
    return subjects;
  }

  Future<void> updateUser(
      {required String name, required List subjects}) async {
    await notiUsers.doc(uid).update({
      'name': name, // John Doe
      'term': 'Jan April 2022', // Stokes and Sons
      'subjects': subjects, // 42
    });
  }
}
