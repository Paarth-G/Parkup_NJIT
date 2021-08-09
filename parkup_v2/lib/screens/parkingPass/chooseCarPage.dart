import 'package:flutter/material.dart';
import 'package:parkup_v2/model/carModel.dart';
import 'package:parkup_v2/library/reusableCard.dart';

class ChooseCarPage extends StatelessWidget {
  ChooseCarPage({
    this.lot,
    this.address,
    this.type,
  });

  final String lot, address, type;

  static TextStyle titleStyle = TextStyle(
    fontSize: 30,
    //fontWeight: FontWeight.bold,
  );

  Color njitBlue = const Color(0xff010033);

  @override
  Widget build(BuildContext context) {
    final List<Widget> carList = [];

    for (Car car in kCars) {
      carList.add(CarButton(
        icon: Icon(
          Icons.directions_car,
          size: 80,
        ),
        lotName: lot,
        lotAddress: address,
        passType: type,
        car: car,
      ));
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: njitBlue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select Car",
              style: titleStyle,
            ),
            Column(children: carList),
          ],
        ),
      ),
    );
  }
}
