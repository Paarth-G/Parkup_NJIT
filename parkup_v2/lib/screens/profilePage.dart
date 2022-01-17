import 'package:flutter/material.dart';
import 'package:parkup_v2/screens/welcome/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    Color njitRed = const Color(0xffCD0200);

    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: njitRed,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 200),
            SizedBox(height: 0),
            Text(
              auth.currentUser.email,
              style: nameStyle,
            ),
            SizedBox(height: 20),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: njitRed,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width - 80,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                },
                child: Text(
                  "LOG OUT",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
