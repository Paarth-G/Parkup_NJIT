import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkup_v2/model/carModel.dart';
import 'package:parkup_v2/screens/registeredCars/registerCarPage.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  // List of cars register
  Widget bodyData() => DataTable(
        onSelectAll: (b) {},
        sortColumnIndex: 0,
        sortAscending: true,
        columns: <DataColumn>[
          DataColumn(
            label: Text('Model'),
            numeric: false,
            tooltip: 'Make and Model of registered vehicle',
            onSort: (i, b) {
              setState(() {
                print('$i,$b');
                kCars.sort((a, b) => a.make.compareTo(b.make));
              });
            },
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
          )
        ],
        rows: kCars
            .map(
              (car) => DataRow(
                cells: [
                  DataCell(
                    Text(car.make),
                  ),
                  DataCell(
                    Text(car.licensePlate),
                  ),
                  DataCell(
                    Text(car.color),
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
        title: Text("Cars Registered"),
        backgroundColor: njitRed,
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
      body: ListView(
        children: [
          bodyData(),
        ],
      ),
    );
  }
}
