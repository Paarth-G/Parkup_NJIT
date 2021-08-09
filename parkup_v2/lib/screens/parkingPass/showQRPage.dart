import 'package:flutter/material.dart';
import 'package:parkup_v2/model/passModel.dart';

class ShowQRPage extends StatelessWidget {
  ShowQRPage({this.pass});

  final Pass pass;

  Color njitBlue = const Color(0xff010033);

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
            Flexible(
              child: SizedBox(
                height: 200.0,
                child: Image.asset(
                  "assets/images/demoQR.png",
                  fit: BoxFit.contain,
                ),
              ),
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
              pass.parkingLot,
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
              "Expires on " +
                  (pass.endDate.month.toString() +
                      "/" +
                      pass.endDate.day.toString() +
                      "/" +
                      pass.endDate.year.toString()),
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
