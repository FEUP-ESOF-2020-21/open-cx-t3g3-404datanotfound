import 'package:flutter_driver/driver_extension.dart';
import 'package:ConfereceBook/Event_Specific/JoinAnEvent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  enableFlutterDriverExtension();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    Map<dynamic, dynamic> map;
    await FirebaseDatabase.instance
        .reference()
        .once()
        .then((DataSnapshot snapshot) {
          map = snapshot.value;
    });
    await FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: "teste@gherkin.com", password: "123456");
      try {
        await FirebaseDatabase
            .instance // delete from Firebase
            .reference()
            .child("Conferences")
            .child("id2")
            .child("users")
            .child("SywRccbU5HOgsiDj8lJtgAgilHv1")
            .remove();
      } catch (e) {
        //The user is already out of the conference
      }
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(Code(map: map)));
  });
}

class Code extends StatelessWidget {
  Code({Key key, this.map}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Map<dynamic, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ConferenceBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: JoinAnEvent(auth: _auth, map: map));
  }
}