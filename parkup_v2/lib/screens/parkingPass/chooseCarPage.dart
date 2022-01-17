import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkup_v2/model/carModel.dart';
import 'package:parkup_v2/library/reusableCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChooseCarPage extends StatelessWidget {
  ChooseCarPage({
    this.lot,
    this.address,
    this.type,
  });

  final String lot, address, type;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  static TextStyle titleStyle = TextStyle(
    fontSize: 30,
    //fontWeight: FontWeight.bold,
  );

  Color njitBlue = const Color(0xff010033);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: njitBlue, title: Text("Which Car")),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              StreamBuilder(
                stream: _firestore
                    .collection("cars")
                    .where('userid', isEqualTo: _auth.currentUser.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final cars = snapshot.data.docs;
                  List<Widget> typeWidgets = [];
                  for (var c in cars) {
                    final typeWidget = CarButton(
                      icon: Icon(Icons.directions_car, size: 80),
                      lotName: lot,
                      lotAddress: address,
                      passType: type,
                      color: c.data()['color'],
                      make: c.data()['make'],
                      plate: c.data()['licensePlate'],
                    );
                    typeWidgets.add(typeWidget);
                  }
                  return Column(children: typeWidgets);
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}
