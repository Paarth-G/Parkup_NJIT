import 'package:flutter/material.dart';
import 'package:parkup_v2/model/carModel.dart';
import 'package:parkup_v2/screens/parkingPass/checkOutPage.dart';
import 'package:parkup_v2/screens/parkingPass/chooseTypePage.dart';
import 'package:parkup_v2/screens/parkingPass/chooseCarPage.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.colour,
    @required this.cardChild,
  });

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        //borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class LotButton extends StatelessWidget {
  LotButton({
    @required this.icon,
    @required this.lotName,
    @required this.lotAddress,
  });

  final Icon icon;
  final String lotName;
  final String lotAddress;

  static TextStyle lotNameStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseTypePage(
              lot: lotName,
              address: lotAddress,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lotName,
                  style: lotNameStyle,
                ),
                SizedBox(height: 5),
                Text(lotAddress),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PassTypeButton extends StatelessWidget {
  PassTypeButton({
    @required this.icon,
    @required this.lotName,
    @required this.lotAddress,
    @required this.passType,
    @required this.passCaption,
  });

  final Icon icon;
  final String lotName, lotAddress;
  final String passType, passCaption;

  static TextStyle passNameStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseCarPage(
              lot: lotName,
              address: lotAddress,
              type: passType,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  passType,
                  style: passNameStyle,
                ),
                SizedBox(height: 5),
                Text(passCaption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CarButton extends StatelessWidget {
  CarButton({
    @required this.icon,
    @required this.lotName,
    @required this.lotAddress,
    @required this.passType,
    @required this.car,
  });

  final Icon icon;
  final String lotName, lotAddress;
  final String passType;
  final Car car;

  static TextStyle carNameStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckOutPage(
              lot: lotName,
              lotAddress: lotAddress,
              passType: passType,
              car: car,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.color + " " + car.make,
                  style: carNameStyle,
                ),
                SizedBox(height: 5),
                Text(
                  car.licensePlate,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
