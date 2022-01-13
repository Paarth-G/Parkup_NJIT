import 'package:flutter/material.dart';
import 'package:parkup_v2/library/reusableCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChooseTypePage extends StatelessWidget {
  ChooseTypePage({@required this.lot, @required this.address});

  final String lot, address;

  static TextStyle titleStyle = TextStyle(
    fontSize: 30,
    //fontWeight: FontWeight.bold,
  );

  final _firestore = FirebaseFirestore.instance;
  Color njitBlue = const Color(0xff010033);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: njitBlue,
        title: Text("What Type of Pass"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: _firestore
                    .collection("passType")
                    .orderBy("type")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final types = snapshot.data.docs;
                  List<Widget> typeWidgets = [];
                  for (var type in types) {
                    final typeWidget = PassTypeButton(
                      icon: Icon(Icons.access_time, size: 60),
                      lotName: lot,
                      lotAddress: address,
                      passType: type.data()['type'],
                      passCaption: type.data()['description'],
                    );
                    typeWidgets.add(typeWidget);
                  }
                  return Column(children: typeWidgets);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
