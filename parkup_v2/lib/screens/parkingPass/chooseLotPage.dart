import 'package:flutter/material.dart';
import 'package:parkup_v2/library/reusableCard.dart';

class ChooseLotPage extends StatelessWidget {
  static TextStyle titleStyle = TextStyle(
    fontSize: 25,
    //fontWeight: FontWeight.bold,
  );

  Color njitBlue = const Color(0xff010033);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: njitBlue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose Parking Lot",
              style: titleStyle,
            ),
            SizedBox(height: 20),
            LotButton(
              icon: Icon(
                Icons.business,
                size: 60,
              ),
              lotName: "Science & Tech Lot",
              lotAddress: "42 Wilsey Street, Newark, NJ",
            ),
            LotButton(
              icon: Icon(
                Icons.business,
                size: 60,
              ),
              lotName: "Parking Deck",
              lotAddress: "154 Summit Street, Newark, NJ",
            ),
            LotButton(
              icon: Icon(
                Icons.business,
                size: 60,
              ),
              lotName: "Parking Lot #10",
              lotAddress: "46 Wilsey Street, Newark, NJ",
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
