import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noti_app/services/auth.dart';
import 'package:noti_app/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noti_app/models/user_model.dart';

const Color kBgColor = Color(0xff1E2E69);

late QuerySnapshot activitiesSnapshot;
late QuerySnapshot assessmentsSnapshot;
late QuerySnapshot generalSnapshot;
late int notisToday;
late CollectionReference notiUsers;
late NotiUser currentUser;
DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
String dateToday = DateFormat.MMMd('en_US').format(now).toString();

final AuthService _auth = AuthService();

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({required Key key, required this.onInitializationComplete})
      : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _setup().then((_) => widget.onInitializationComplete());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'noti App',
      theme: ThemeData(
          backgroundColor: kBgColor, scaffoldBackgroundColor: kBgColor),
      home: Scaffold(
        body: Center(
            child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('google_fonts/noti-logo.png'),
                  fit: BoxFit.contain)),
        )),
      ),
    );
  }

  Future<void> _setup() async {
    CrudMethods crudMethods = CrudMethods();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    notiUsers = await FirebaseFirestore.instance.collection('users');
    currentUser = await _auth.signInAnon();
    List tempSubjects = await currentUser.createUser();
    activitiesSnapshot = await crudMethods.getData('activities', tempSubjects);
    assessmentsSnapshot =
        await crudMethods.getData('assessments', tempSubjects);
    generalSnapshot = await crudMethods.getData('general', tempSubjects);
    notisToday = notisTodayCounter();
  }

  int notisTodayCounter() {
    int temp = 0;
    temp += generalSnapshot.docs.length;
    activitiesSnapshot.docs.forEach((doc) {
      if (int.parse(doc['date'].substring(0, 2)) == date.day.toInt()) {
        temp += 1;
      }
    });
    assessmentsSnapshot.docs.forEach((doc) {
      if (int.parse(doc['date'].substring(0, 2)) == date.day.toInt()) {
        temp += 1;
      }
    });
    return temp;
  }
}
