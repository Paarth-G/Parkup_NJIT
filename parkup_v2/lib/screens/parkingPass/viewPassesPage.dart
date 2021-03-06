import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkup_v2/model/passModel.dart';
import 'package:parkup_v2/screens/parkingPass/chooseLotPage.dart';
import 'package:parkup_v2/screens/parkingPass/showQRPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewPassesPage extends StatefulWidget {
  @override
  _ViewPassesPageState createState() => _ViewPassesPageState();
}

class _ViewPassesPageState extends State<ViewPassesPage> {
  Color _njitRed = const Color(0xffCD0200);

  final FirebaseAuth auth = FirebaseAuth.instance;

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('passes')
          .where('userid', isEqualTo: auth.currentUser.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        print(snapshot.data.size);

        return DataTable(
          columns: [
            DataColumn(
              label: Text('Lot'),
              numeric: false,
              tooltip: 'The lot this pass is eligible for',
            ),
            DataColumn(
              label: Text('Type'),
              numeric: false,
              tooltip: 'The type of pass (Daily, Monthly, etc.)',
            ),
            DataColumn(
              label: Text('Expires'),
              numeric: false,
              tooltip: 'When this pass is invalid',
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
    final pass = Pass.fromSnapshot(data);

    return DataRow(cells: [
      DataCell(
        Text(pass.lot),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowQRPage(pass: pass),
            ),
          );
        },
      ),
      DataCell(Text(pass.type)),
      DataCell(Text(pass.expires.toDate().month.toString() +
          "/" +
          pass.expires.toDate().day.toString() +
          "/" +
          pass.expires.toDate().year.toString())),
    ]);
  }

  noCarsAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("No Cars Registered"),
          content: Text("You must register a car before buying a pass."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Passes"),
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
            onPressed: () async {
              Future<bool> _hasCars() async {
                QuerySnapshot _query = await FirebaseFirestore.instance
                    .collection('cars')
                    .where('userid', isEqualTo: auth.currentUser.uid)
                    .get();
                if (_query.docs.isNotEmpty) {
                  return true;
                } else {
                  return false;
                }
              }

              bool _has = await _hasCars();

              if (_has) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseLotPage()),
                );
              } else {
                noCarsAlertDialog(context);
              }
            },
          )
        ],
      ),
      body: ListView(children: [_buildBody(context)]),
    );
  }
}
