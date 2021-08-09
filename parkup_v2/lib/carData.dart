import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  final where = Uri.encodeQueryComponent(jsonEncode({
    "Make": {"\$exists": true},
  }));
  final response = await http.get(
      'https://parseapi.back4app.com/classes/Carmodels_Car_Model_List?limit=10&order=Make&excludeKeys=Year&where=$where',
      headers: {
        "X-Parse-Application-Id":
            "B81mSpHkkioEZU8g7zjIZmFtAYgrz0T28MUtSpvi", // This is your app's application id
        "X-Parse-REST-API-Key":
            "zftxvsmW1QWw5cDJ2viCFbLdJFYZW2yFM4HSpHCO" // This is your app's REST API key
      });
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData(); // Here you have the data that you need
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: new SingleChildScrollView(
            child: FutureBuilder<Map<String, dynamic>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      new JsonEncoder.withIndent('  ').convert(snapshot.data));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
