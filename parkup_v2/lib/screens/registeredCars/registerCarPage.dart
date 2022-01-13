import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:parkup_v2/screens/tabBarScreen.dart';
import 'package:parkup_v2/model/carModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterCarPage extends StatefulWidget {
  @override
  _RegisterCarPageState createState() => _RegisterCarPageState();
}

class _RegisterCarPageState extends State<RegisterCarPage> {
  final List<DropdownMenuItem> items = [];
  final _firestore = FirebaseFirestore.instance;

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
              DropdownSearch<String>(
                mode: Mode.MENU,
                items: kCarMakes,
                selectedItem: make,
                showClearButton: true,
                hint: "Honda, Toyota, BMW, etc.",
                onChanged: (value) {
                  setState(() {
                    make = value;
                  });
                },
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
              DropdownSearch(
                mode: Mode.MENU,
                items: kStyles,
                selectedItem: style,
                showClearButton: true,
                hint: "SUV, Convertible, etc.",
                onChanged: (value) {
                  setState(() {
                    style = value;
                  });
                },
              ),
              Text("Color", style: infoStyle),
              DropdownSearch(
                mode: Mode.MENU,
                items: kColors,
                selectedItem: color,
                showClearButton: true,
                hint: "Red, Blue, White, etc.",
                onChanged: (value) {
                  setState(() {
                    color = value;
                  });
                },
              ),
              SizedBox(height: 40),
              Text("License Plate", style: infoStyle),
              licensePlateField,
              DropdownSearch(
                mode: Mode.MENU,
                items: kStates,
                selectedItem: state,
                showClearButton: true,
                hint: "State",
                onChanged: (value) {
                  setState(() {
                    state = value;
                  });
                },
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
                  _firestore.collection('cars').add({
                    'make': make,
                    'style': style,
                    'color': color,
                    'licensePlate': plate,
                    'state': state,
                  });

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
