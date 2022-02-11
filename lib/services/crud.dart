import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noti_app/pages/splash_page.dart';

class CrudMethods {
  getData(String collectionName, List subjects) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .where('subjects', arrayContainsAny: subjects)
        .get();
  }
}
