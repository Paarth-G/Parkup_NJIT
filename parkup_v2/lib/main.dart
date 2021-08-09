import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parkup_v2/screens/welcome/welcomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("something went wrong!");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ParkupApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ParkupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red[800],
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black54)),
        accentColor: Colors.red[800],
      ),
      */
      home: WelcomePage(),
    );
  }
}
