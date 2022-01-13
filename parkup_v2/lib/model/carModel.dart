import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Car {
  // Properties of a registered Car
  final String make;
  final String style;
  final String color;
  final String licensePlate;
  final String state;
  final DocumentReference reference;

  Car.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['make'] != null),
        assert(map['style'] != null),
        assert(map['color'] != null),
        assert(map['licensePlate'] != null),
        assert(map['state'] != null),
        make = map['make'],
        style = map['style'],
        color = map['color'],
        licensePlate = map['licensePlate'],
        state = map['state'];

  Car.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

List<Car> kCars = [];

final List<String> kCarMakes = [
  "Acura",
  "Alfa Romeo",
  "American Motors",
  "Aston Martin",
  "Audi",
  "Bentley",
  "BMW",
  "Buick",
  "Cadillac",
  "Chevrolet",
  "Chrysler",
  "Citroen",
  "Colt",
  "Crossroads",
  "Daewoo",
  "Daihatsu",
  "Datsun",
  "Dodge",
  "Ducati",
  "Eagle",
  "Ferrari",
  "Fiat",
  "Ford",
  "Freightliner",
  "General Motors",
  "Geo",
  "Harley Davidson",
  "Honda",
  "Hummer",
  "Hyundai",
  "Infiniti",
  "Isuzu",
  "Jaguar",
  "Jayco",
  "Jeep",
  "Kawasaki",
  "Keystone",
  "Kia",
  "Lamborghini",
  "Land Rover",
  "Lexus",
  "Lincoln",
  "Lotus",
  "Maserati",
  "Mazda",
  "Mercedes-Benz",
  "Mercury",
  "Merkur",
  "MG",
  "Mini",
  "Mitsubishi",
  "Newmar",
  "Nissan",
  "Oldsmobile",
  "Peugeot",
  "Plymouth",
  "Pontiac",
  "Porsche",
  "Renault",
  "Rolls-Royce",
  "Saab",
  "Saturn",
  "Scion",
  "Subaru",
  "Suzuki",
  "Tesla",
  "Toyota",
  "Triumph",
  "Volkswagen",
  "Volvo",
  "Winnebago",
  "Yamaha",
  "Yugo",
  "Other",
];

final List<String> kStyles = [
  "Three Door",
  "Camper",
  "Convertible",
  "Four Door",
  "Hatchback",
  "Motorcycle",
  "SUV",
  "Station Wagon",
  "Truck",
  "Two Door",
  "Van",
  "Other",
  "N/A",
];

final List<String> kColors = [
  "Aqua",
  "Beige",
  "Black",
  "Blue",
  "Brown",
  "Burgundy",
  "Chrome",
  "Copper",
  "Cream",
  "Dark Blue",
  "Dark Green",
  "Gold",
  "Gray",
  "Green",
  "Ivory",
  "Lavender",
  "Mauve",
  "Orange",
  "Peach",
  "Pink",
  "Purple",
  "Red",
  "Silver",
  "Tan",
  "Titanium",
  "White",
  "Yellow",
  "Other",
  "N/A",
];

final List<String> kStates = [
  "Alabama",
  "Alaska",
  "Arizona",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachuessetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennesee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming",
  "Other",
];
