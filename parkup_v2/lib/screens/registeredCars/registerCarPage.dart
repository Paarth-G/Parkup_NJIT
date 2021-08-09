import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:parkup_v2/screens/tabBarScreen.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:parkup_v2/model/carModel.dart';

class RegisterCarPage extends StatefulWidget {
  @override
  _RegisterCarPageState createState() => _RegisterCarPageState();
}

class _RegisterCarPageState extends State<RegisterCarPage> {
  final List<DropdownMenuItem> items = [];

  TextStyle infoStyle = TextStyle(
    fontSize: 25,
  );

  String make, style, color, plate, state;
  Color njitBlue = const Color(0xff010033);

  @override
  Widget build(BuildContext context) {
    final licensePlateField = TextFormField(
      obscureText: false,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "License Plate Number",
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: (value) {
        setState(() {
          plate = value;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Register Your Car"),
        backgroundColor: njitBlue,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 26),
          child: ListView(
            children: [
              Text("Make", style: infoStyle),
              SearchableDropdown.single(
                items: kCarMakes,
                value: make,
                hint: "Honda, Toyota, BMW, etc.",
                searchHint: "Car Make",
                onChanged: (value) {
                  setState(() {
                    make = value;
                  });
                },
                isExpanded: true,
              ),
              /*Text("Model", style: infoStyle),
              SearchableDropdown.single(
                items: items,
                value: model,
                hint: "Model",
                searchHint: "Select one",
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                isExpanded: true,
              ),*/
              Text("Style", style: infoStyle),
              SearchableDropdown.single(
                items: kStyles,
                value: style,
                hint: "SUV, Convertible, etc.",
                searchHint: "Car Style",
                onChanged: (value) {
                  setState(() {
                    style = value;
                  });
                },
                isExpanded: true,
              ),
              Text("Color", style: infoStyle),
              SearchableDropdown.single(
                items: kColors,
                value: color,
                hint: "Red, Blue, White, etc.",
                searchHint: "Color of Car",
                onChanged: (value) {
                  setState(() {
                    color = value;
                  });
                },
                isExpanded: true,
              ),
              SizedBox(height: 40),
              Text("License Plate", style: infoStyle),
              licensePlateField,
              SearchableDropdown.single(
                items: kStates,
                value: state,
                hint: "State",
                searchHint: "State",
                onChanged: (value) {
                  setState(() {
                    state = value;
                  });
                },
                isExpanded: true,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        child: Center(
          child: RawMaterialButton(
            child: Text("Register"),
            onPressed: () {
              setState(() {
                if (make != null &&
                    style != null &&
                    color != null &&
                    plate != null &&
                    state != null) {
                  kCars.add(Car(
                    make: make,
                    style: style,
                    color: color,
                    licensePlate: plate,
                    state: state,
                  ));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarScreen()),
                  );
                }
              });
            },
          ),
        ),
        color: Colors.white,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 75,
      ),
    );
  }
}
