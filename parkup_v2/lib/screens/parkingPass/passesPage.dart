import 'package:flutter/material.dart';
import 'package:parkup_v2/model/passModel.dart';
import 'package:parkup_v2/screens/parkingPass/chooseLotPage.dart';
import 'showQRPage.dart';

class PassesPage extends StatefulWidget {
  @override
  _PassesPageState createState() => _PassesPageState();
}

class _PassesPageState extends State<PassesPage> {
  // List of cars register
  Widget passesTable() => DataTable(
        onSelectAll: (b) {},
        sortColumnIndex: 0,
        sortAscending: true,
        columns: <DataColumn>[
          DataColumn(
            label: Text('Lot'),
            numeric: false,
            tooltip: 'Which lot are they permitted to park',
          ),
          DataColumn(
            label: Text('Type'),
            numeric: false,
            tooltip: 'Daily, Monthly, and Semester',
          ),
          DataColumn(
            label: Text('Expires'),
            numeric: false,
            tooltip: 'When does this pass expire',
          ),
        ],
        rows: kPasses
            .map(
              (pass) => DataRow(
                cells: [
                  DataCell(Text(pass.parkingLot), onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowQRPage(pass: pass),
                      ),
                    );
                  }),
                  DataCell(Text(pass.type)),
                  DataCell(
                    Text(pass.endDate.month.toString() +
                        "/" +
                        pass.endDate.day.toString() +
                        "/" +
                        pass.endDate.year.toString()),
                  ),
                ],
              ),
            )
            .toList(),
      );

  Color njitRed = const Color(0xffCD0200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passes"),
        backgroundColor: njitRed,
        actions: [
          TextButton(
            child: Text(
              'New Pass',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChooseLotPage()),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          passesTable(),
        ],
      ),
    );
  }
}
