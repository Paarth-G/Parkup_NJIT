import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkup_v2/model/carModel.dart';
import 'package:parkup_v2/screens/registeredCars/registerCarPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewCarsPage extends StatefulWidget {
  @override
  _ViewCarsPageState createState() => _ViewCarsPageState();
}

class _ViewCarsPageState extends State<ViewCarsPage> {
  Color _njitRed = const Color(0xffCD0200);

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('cars').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return DataTable(
          columns: [
            DataColumn(
              label: Text('Make'),
              numeric: false,
              tooltip: 'Make and Model of registered vehicle',
            ),
            DataColumn(
              label: Text('License Plate'),
              numeric: false,
              tooltip: 'License Plate of registered vehicle',
            ),
            DataColumn(
              label: Text('Color'),
              numeric: false,
              tooltip: 'Exterior Color of vehicle',
            ),
          ],
          rows: _buildList(context, snapshot.data.docs),
        );
      },
    );
  }

  List<DataRow> _buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final car = Car.fromSnapshot(data);

    return DataRow(cells: [
      DataCell(Text(car.make)),
      DataCell(Text(car.licensePlate)),
      DataCell(Text(car.color)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cars Registered"),
        backgroundColor: _njitRed,
        actions: [
          TextButton(
            child: Text(
              '+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterCarPage()),
              );
            },
          )
        ],
      ),
      body: ListView(children: [_buildBody(context)]),
    );
  }
}
