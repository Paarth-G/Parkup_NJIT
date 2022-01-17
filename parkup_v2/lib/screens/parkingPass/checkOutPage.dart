import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:parkup_v2/library/reusableCard.dart';
import 'package:parkup_v2/model/creditCardModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../tabBarScreen.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({
    @required this.lot,
    @required this.lotAddress,
    @required this.passType,
    @required this.color,
    @required this.make,
    @required this.plate,
  });

  final String lot, lotAddress;
  final String passType;
  final String color, make, plate;

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidate = false;

  var _card = new PaymentCard();

  var pass;

  Color njitBlue = const Color(0xff010033);

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
        backgroundColor: njitBlue,
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          ReusableCard(
            colour: Colors.grey[300],
            cardChild: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.passType + " Pass",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$XX.XX",
                    style: TextStyle(
                      fontSize: 27,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ReusableCard(
            colour: Colors.grey[300],
            cardChild: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          widget.lot,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.lotAddress,
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.business,
                    size: 60,
                  ),
                ],
              ),
            ),
          ),
          ReusableCard(
            colour: Colors.grey[300],
            cardChild: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          widget.make + " | " + widget.plate,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.directions_car,
                    size: 60,
                  ),
                ],
              ),
            ),
          ),
          ReusableCard(
            colour: Colors.grey[300],
            cardChild: Container(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text("Credit/Debit Card"),
                    new SizedBox(height: 20.0),
                    new TextFormField(
                      decoration: const InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: true,
                        icon: const Icon(
                          Icons.person,
                          size: 40.0,
                        ),
                        hintText: 'What name is written on card?',
                        labelText: 'Name',
                      ),
                      onSaved: (String value) {
                        _card.name = value;
                      },
                      keyboardType: TextInputType.text,
                      validator: (String value) =>
                          value.isEmpty ? Strings.fieldReq : null,
                    ),
                    new SizedBox(height: 30.0),
                    new TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        new LengthLimitingTextInputFormatter(19),
                        new CardNumberInputFormatter()
                      ],
                      controller: numberController,
                      decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: true,
                        icon: CardUtils.getCardIcon(_paymentCard.type),
                        hintText: 'What number is written on card?',
                        labelText: 'Number',
                      ),
                      onSaved: (String value) {
                        print('onSaved = $value');
                        print('Num controller has = ${numberController.text}');
                        _paymentCard.number = CardUtils.getCleanedNumber(value);
                      },
                      validator: CardUtils.validateCardNum,
                    ),
                    new SizedBox(height: 30.0),
                    new TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        new LengthLimitingTextInputFormatter(4),
                      ],
                      decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: true,
                        icon: new Image.asset(
                          'assets/images/card_cvv.png',
                          width: 40.0,
                          color: Colors.grey[600],
                        ),
                        hintText: 'Number behind the card',
                        labelText: 'CVV',
                      ),
                      validator: CardUtils.validateCVV,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _paymentCard.cvv = int.parse(value);
                      },
                    ),
                    new SizedBox(height: 30.0),
                    new TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        new LengthLimitingTextInputFormatter(4),
                        new CardMonthInputFormatter()
                      ],
                      decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: true,
                        icon: new Image.asset(
                          'assets/images/calender.png',
                          width: 40.0,
                          color: Colors.grey[600],
                        ),
                        hintText: 'MM/YY',
                        labelText: 'Expiry Date',
                      ),
                      validator: CardUtils.validateDate,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        List<int> expiryDate = CardUtils.getExpiryDate(value);
                        _paymentCard.month = expiryDate[0];
                        _paymentCard.year = expiryDate[1];
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            child: ReusableCard(
              colour: njitBlue,
              cardChild: Container(
                child: Container(
                  child: Center(
                    child: Text(
                      "Purchase Pass",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                DateTime currentTime = DateTime.now().toLocal();
                DateTime endTime = getEndTime(widget.passType, currentTime);

                _firestore.collection('passes').add({
                  'lot': widget.lot,
                  'address': widget.lotAddress,
                  'type': widget.passType,
                  'starts': currentTime,
                  'expires': endTime,
                  'plate': widget.plate,
                  'userid': _auth.currentUser.uid,
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBarScreen()),
                );
              });
            },
          ),
          /*
          new SizedBox(
            height: 50.0,
          ),
          new Container(
            alignment: Alignment.center,
            child: _getPayButton(),
          )
          */
        ],
      ),
    );
  }

  DateTime getEndTime(String passType, DateTime startTime) {
    if (passType == "Daily") {
      return startTime.add(new Duration(days: 1));
    } else if (passType == "Monthly") {
      return startTime.add(new Duration(days: 30));
    } else if (passType == "Semester") {
      return DateTime.utc(2022, 5, 15);
    } else {
      return startTime.add(new Duration(days: 1));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
      _showInSnackBar('Payment card is valid');
    }
  }

  Widget _getPayButton() {
    if (Platform.isIOS) {
      return new CupertinoButton(
        onPressed: _validateInputs,
        color: CupertinoColors.activeBlue,
        child: const Text(
          Strings.pay,
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    } else {
      return new RaisedButton(
        onPressed: _validateInputs,
        color: Colors.deepOrangeAccent,
        splashColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(100.0)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
        textColor: Colors.white,
        child: new Text(
          Strings.pay.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    }
  }

  void _showInSnackBar(String value) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }
}
