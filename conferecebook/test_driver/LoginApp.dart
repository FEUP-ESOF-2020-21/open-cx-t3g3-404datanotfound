import 'package:flutter_driver/driver_extension.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ConfereceBook/Login/Login.dart';

void main() async {
  enableFlutterDriverExtension();

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((value) {
      runApp(Login());
    });
  });

}

class Login extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ConferenceBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyLogin(auth: _auth));
  }
}