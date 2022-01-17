import 'package:flutter/material.dart';
import 'package:parkup_v2/model/passModel.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQRPage extends StatelessWidget {
  ShowQRPage({this.pass});

  final Pass pass;

  Color njitBlue = const Color(0xff010033);

  String formattedTime() {
    int hour = pass.expires.toDate().hour % 12;
    int minute = pass.expires.toDate().minute;
    String ampm = pass.expires.toDate().hour > 12 ? " PM" : " AM";

    return hour.toString() + ":" + minute.toString() + ampm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: njitBlue),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            QrImage(
              data: pass.reference.id,
              size: 200,
            ),
            SizedBox(height: 20),
            Text(
              pass.type + " Pass",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
            Text(
              pass.lot,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              pass.address,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Expires: " +
                  pass.expires.toDate().month.toString() +
                  "/" +
                  pass.expires.toDate().day.toString() +
                  "/" +
                  pass.expires.toDate().year.toString() +
                  " at " +
                  formattedTime(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
