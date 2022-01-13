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
    @required this.code,
    @required this.lotName,
    @required this.lotAddress,
  });

  final String code, lotName, lotAddress;

  static TextStyle lotNameStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle lotCodeStyle = TextStyle(
    fontSize: 25,
    //fontWeight: FontWeight.bold,
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
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child: Text(lotName, style: lotNameStyle)),
                SizedBox(height: 5),
                Container(child: Text(lotAddress)),
              ],
            ),
            Container(child: Text(code, style: lotCodeStyle)),
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
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child: Text(passType, style: passNameStyle)),
                SizedBox(height: 5),
                Container(child: Text(passCaption)),
              ],
            ),
            Center(child: icon),
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
    @required this.color,
    @required this.make,
    @required this.plate,
  });

  final Icon icon;
  final String lotName, lotAddress;
  final String passType;
  final String color, make, plate;

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
              color: color,
              make: make,
              plate: plate,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  color + " " + make,
                  style: carNameStyle,
                ),
                SizedBox(height: 5),
                Text(
                  plate,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
