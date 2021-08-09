import 'package:flutter/material.dart';
import 'package:parkup_v2/library/reusableCard.dart';

class ChooseTypePage extends StatelessWidget {
  ChooseTypePage({@required this.lot, @required this.address});

  final String lot, address;

  static TextStyle titleStyle = TextStyle(
    fontSize: 30,
    //fontWeight: FontWeight.bold,
  );

  Color njitBlue = const Color(0xff010033);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: njitBlue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Choose Type of Pass",
            style: titleStyle,
          ),
          SizedBox(height: 10),
          PassTypeButton(
            icon: Icon(
              Icons.access_time,
              size: 60,
            ),
            lotName: lot,
            lotAddress: address,
            passType: "Daily",
            passCaption: "Park up to 24 hours",
          ),
          PassTypeButton(
            icon: Icon(
              Icons.calendar_today,
              size: 60,
            ),
            lotName: lot,
            lotAddress: address,
            passType: "Monthly",
            passCaption: "Valid for 30 days",
          ),
          PassTypeButton(
            icon: Icon(
              Icons.local_library,
              size: 60,
            ),
            lotName: lot,
            lotAddress: address,
            passType: "Semester",
            passCaption: "Valid for the whole semester",
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
