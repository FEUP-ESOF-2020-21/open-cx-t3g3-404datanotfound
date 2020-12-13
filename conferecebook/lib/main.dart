import 'package:ConfereceBook/JoinAnEvent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ConfereceBook/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Map<dynamic, dynamic> map;
  await FirebaseDatabase.instance
      .reference()
      .once()
      .then((DataSnapshot snapshot) {
    map = snapshot.value;
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp(map: map)));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.map}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Map<dynamic, dynamic> map;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ConferenceBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: (_auth.currentUser == null)
            ? MyLogin(auth: _auth)
            : JoinAnEvent(auth: _auth, map: map));
  }
}

//What is this?
const String _svg_2rnm7d =
    '<svg viewBox="0.0 0.0 45.0 45.0" ><path  d="M 0 0 L 45 0 L 45 45 L 0 45 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2oyv8c =
    '<svg viewBox="7.5 7.5 30.0 30.0" ><path transform="translate(3.5, 3.5)" d="M 19 4 L 16.35625076293945 6.643749237060547 L 26.81875038146973 17.125 L 4 17.125 L 4 20.875 L 26.81875038146973 20.875 L 16.35625076293945 31.35625076293945 L 19 34 L 34 19 L 19 4 Z" fill="#680aee" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
