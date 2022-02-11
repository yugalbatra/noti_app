import 'package:firebase_auth/firebase_auth.dart';
import 'package:noti_app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  NotiUser _userFromFirebase(var userUid) {
    return NotiUser(uid: userUid);
  }

  Future signInAnon() async {
    try {
      dynamic result = await _auth.signInAnonymously();
      return _userFromFirebase(result.user.uid);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
