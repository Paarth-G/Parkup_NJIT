import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkup_v2/library/reusableCard.dart';

class ChooseLotPage extends StatelessWidget {
  static TextStyle titleStyle = TextStyle(
    fontSize: 25,
    //fontWeight: FontWeight.bold,
  );

  final _firestore = FirebaseFirestore.instance;
  Color njitBlue = const Color(0xff010033);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Which Parking Lot"),
        backgroundColor: njitBlue,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: _firestore.collection('lots').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final lots = snapshot.data.docs;
                  List<Widget> lotWidgets = [];
                  for (var lot in lots) {
                    final String lotName = lot.data()['name'];
                    final lotWidget = LotButton(
                      code: lot.data()['code'],
                      lotName: lot.data()['name'],
                      lotAddress: lot.data()['address'],
                    );
                    lotWidgets.add(lotWidget);
                  }
                  return Column(children: lotWidgets);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
