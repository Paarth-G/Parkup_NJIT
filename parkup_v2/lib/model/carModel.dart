import 'package:flutter/material.dart';

class Car {
  // Properties of a registered Car
  final String make;
  // final String model;
  final String style;
  final String color;
  final String licensePlate;
  final String state;

  // Constructor
  Car({
    this.make,
    //this.model,
    this.style,
    this.color,
    this.licensePlate,
    this.state,
  });
}

List<Car> kCars = [];

final List<DropdownMenuItem> kCarMakes = [
  DropdownMenuItem(child: Text("Acura"), value: "Acura"),
  DropdownMenuItem(child: Text("Alfa Romeo"), value: "Alfa Romeo"),
  DropdownMenuItem(child: Text("American Motors"), value: "American Motors"),
  DropdownMenuItem(child: Text("Aston Martin"), value: "Aston Martin"),
  DropdownMenuItem(child: Text("Audi"), value: "Audi"),
  DropdownMenuItem(child: Text("Bentley"), value: "Bentley"),
  DropdownMenuItem(child: Text("BMW"), value: "BMW"),
  DropdownMenuItem(child: Text("Buick"), value: "Buick"),
  DropdownMenuItem(child: Text("Cadillac"), value: "Cadillac"),
  DropdownMenuItem(child: Text("Chevrolet"), value: "Chevrolet"),
  DropdownMenuItem(child: Text("Chrysler"), value: "Chrysler"),
  DropdownMenuItem(child: Text("Citroen"), value: "Citroen"),
  DropdownMenuItem(child: Text("Colt"), value: "Colt"),
  DropdownMenuItem(child: Text("Crossroads"), value: "Crossroads"),
  DropdownMenuItem(child: Text("Daewoo"), value: "Daewoo"),
  DropdownMenuItem(child: Text("Daihatsu"), value: "Daihatsu"),
  DropdownMenuItem(child: Text("Datsun"), value: "Datsun"),
  DropdownMenuItem(child: Text("Dodge"), value: "Dodge"),
  DropdownMenuItem(child: Text("Ducati"), value: "Ducati"),
  DropdownMenuItem(child: Text("Eagle"), value: "Eagle"),
  DropdownMenuItem(child: Text("Ferrari"), value: "Ferrari"),
  DropdownMenuItem(child: Text("Fiat"), value: "Fiat"),
  DropdownMenuItem(child: Text("Ford"), value: "Ford"),
  DropdownMenuItem(child: Text("Freightliner"), value: "Freightliner"),
  DropdownMenuItem(child: Text("General Motors"), value: "General Motors"),
  DropdownMenuItem(child: Text("Geo"), value: "Geo"),
  DropdownMenuItem(child: Text("Harley Davidson"), value: "Harley Davidson"),
  DropdownMenuItem(child: Text("Honda"), value: "Honda"),
  DropdownMenuItem(child: Text("Hummer"), value: "Hummer"),
  DropdownMenuItem(child: Text("Hyundai"), value: "Hyundai"),
  DropdownMenuItem(child: Text("Infiniti"), value: "Infiniti"),
  DropdownMenuItem(child: Text("Isuzu"), value: "Isuzu"),
  DropdownMenuItem(child: Text("Jaguar"), value: "Jaguar"),
  DropdownMenuItem(child: Text("Jayco"), value: "Jayco"),
  DropdownMenuItem(child: Text("Jeep"), value: "Jeep"),
  DropdownMenuItem(child: Text("Kawasaki"), value: "Kawasaki"),
  DropdownMenuItem(child: Text("Keystone"), value: "Keystone"),
  DropdownMenuItem(child: Text("Kia"), value: "Kia"),
  DropdownMenuItem(child: Text("Lamborghini"), value: "Lamborghini"),
  DropdownMenuItem(child: Text("Land Rover"), value: "Land Rover"),
  DropdownMenuItem(child: Text("Lexus"), value: "Lexus"),
  DropdownMenuItem(child: Text("Lincoln"), value: "Lincoln"),
  DropdownMenuItem(child: Text("Lotus"), value: "Lotus"),
  DropdownMenuItem(child: Text("Maserati"), value: "Maserati"),
  DropdownMenuItem(child: Text("Mazda"), value: "Mazda"),
  DropdownMenuItem(child: Text("Mercedes-Benz"), value: "Mercedes-Benz"),
  DropdownMenuItem(child: Text("Mercury"), value: "Mercury"),
  DropdownMenuItem(child: Text("Merkur"), value: "Merkur"),
  DropdownMenuItem(child: Text("MG"), value: "MG"),
  DropdownMenuItem(child: Text("Mini"), value: "Mini"),
  DropdownMenuItem(child: Text("Mitsubishi"), value: "Mitsubishi"),
  DropdownMenuItem(child: Text("Newmar"), value: "Newmar"),
  DropdownMenuItem(child: Text("Nissan"), value: "Nissan"),
  DropdownMenuItem(child: Text("Oldsmobile"), value: "Oldsmobile"),
  DropdownMenuItem(child: Text("Peugeot"), value: "Peugeot"),
  DropdownMenuItem(child: Text("Plymouth"), value: "Plymouth"),
  DropdownMenuItem(child: Text("Pontiac"), value: "Pontiac"),
  DropdownMenuItem(child: Text("Porsche"), value: "Porsche"),
  DropdownMenuItem(child: Text("Renault"), value: "Renault"),
  DropdownMenuItem(child: Text("Rolls-Royce"), value: "Rolls-Royce"),
  DropdownMenuItem(child: Text("Saab"), value: "Saab"),
  DropdownMenuItem(child: Text("Saturn"), value: "Saturn"),
  DropdownMenuItem(child: Text("Scion"), value: "Scion"),
  DropdownMenuItem(child: Text("Subaru"), value: "Subaru"),
  DropdownMenuItem(child: Text("Suzuki"), value: "Suzuki"),
  DropdownMenuItem(child: Text("Tesla"), value: "Tesla"),
  DropdownMenuItem(child: Text("Toyota"), value: "Toyota"),
  DropdownMenuItem(child: Text("Triumph"), value: "Triumph"),
  DropdownMenuItem(child: Text("Volkswagen"), value: "Volkswagen"),
  DropdownMenuItem(child: Text("Volvo"), value: "Volvo"),
  DropdownMenuItem(child: Text("Winnebago"), value: "Winnebago"),
  DropdownMenuItem(child: Text("Yamaha"), value: "Yamaha"),
  DropdownMenuItem(child: Text("Yugo"), value: "Yugo"),
  DropdownMenuItem(child: Text("Other"), value: "Other"),
];

final List<DropdownMenuItem> kStyles = [
  DropdownMenuItem(child: Text("Three Door"), value: "Three Door"),
  DropdownMenuItem(child: Text("Camper"), value: "Camper"),
  DropdownMenuItem(child: Text("Convertible"), value: "Convertible"),
  DropdownMenuItem(child: Text("Four Door"), value: "Four Door"),
  DropdownMenuItem(child: Text("Hatchback"), value: "Hatchback"),
  DropdownMenuItem(child: Text("Motorcycle"), value: "Motorcycle"),
  DropdownMenuItem(child: Text("SUV"), value: "SUV"),
  DropdownMenuItem(child: Text("Station Wagon"), value: "Station Wagon"),
  DropdownMenuItem(child: Text("Truck"), value: "Truck"),
  DropdownMenuItem(child: Text("Two Door"), value: "Two Door"),
  DropdownMenuItem(child: Text("Van"), value: "Van"),
  DropdownMenuItem(child: Text("Other"), value: "Other"),
  DropdownMenuItem(child: Text("N/A"), value: "N/A"),
];

final List<DropdownMenuItem> kColors = [
  DropdownMenuItem(child: Text("Aqua"), value: "Aqua"),
  DropdownMenuItem(child: Text("Beige"), value: "Beige"),
  DropdownMenuItem(child: Text("Black"), value: "Black"),
  DropdownMenuItem(child: Text("Blue"), value: "Blue"),
  DropdownMenuItem(child: Text("Brown"), value: "Brown"),
  DropdownMenuItem(child: Text("Burgundy"), value: "Burgundy"),
  DropdownMenuItem(child: Text("Chrome"), value: "Chrome"),
  DropdownMenuItem(child: Text("Copper"), value: "Copper"),
  DropdownMenuItem(child: Text("Cream"), value: "Cream"),
  DropdownMenuItem(child: Text("Dark Blue"), value: "Dark Blue"),
  DropdownMenuItem(child: Text("Dark Green"), value: "Dark Green"),
  DropdownMenuItem(child: Text("Gold"), value: "Gold"),
  DropdownMenuItem(child: Text("Gray"), value: "Gray"),
  DropdownMenuItem(child: Text("Green"), value: "Green"),
  DropdownMenuItem(child: Text("Ivory"), value: "Ivory"),
  DropdownMenuItem(child: Text("Lavender"), value: "Lavender"),
  DropdownMenuItem(child: Text("Mauve"), value: "Mauve"),
  DropdownMenuItem(child: Text("Orange"), value: "Orange"),
  DropdownMenuItem(child: Text("Peach"), value: "Peach"),
  DropdownMenuItem(child: Text("Pink"), value: "Pink"),
  DropdownMenuItem(child: Text("Purple"), value: "Purple"),
  DropdownMenuItem(child: Text("Red"), value: "Red"),
  DropdownMenuItem(child: Text("Silver"), value: "Silver"),
  DropdownMenuItem(child: Text("Tan"), value: "Tan"),
  DropdownMenuItem(child: Text("Titanium"), value: "Titanium"),
  DropdownMenuItem(child: Text("White"), value: "White"),
  DropdownMenuItem(child: Text("Yellow"), value: "Yellow"),
  DropdownMenuItem(child: Text("Other"), value: "Other"),
  DropdownMenuItem(child: Text("N/A"), value: "N/A"),
];

final List<DropdownMenuItem> kStates = [
  DropdownMenuItem(child: Text("Alabama"), value: "Alabama"),
  DropdownMenuItem(child: Text("Alaska"), value: "Alaska"),
  DropdownMenuItem(child: Text("Arizona"), value: "Arizona"),
  DropdownMenuItem(child: Text("California"), value: "California"),
  DropdownMenuItem(child: Text("Colorado"), value: "Colorado"),
  DropdownMenuItem(child: Text("Connecticut"), value: "Connecticut"),
  DropdownMenuItem(child: Text("Delaware"), value: "Delaware"),
  DropdownMenuItem(child: Text("Florida"), value: "Florida"),
  DropdownMenuItem(child: Text("Georgia"), value: "Georgia"),
  DropdownMenuItem(child: Text("Hawaii"), value: "Hawaii"),
  DropdownMenuItem(child: Text("Idaho"), value: "Idaho"),
  DropdownMenuItem(child: Text("Illinois"), value: "Illinois"),
  DropdownMenuItem(child: Text("Indiana"), value: "Indiana"),
  DropdownMenuItem(child: Text("Iowa"), value: "Iowa"),
  DropdownMenuItem(child: Text("Kansas"), value: "Kansas"),
  DropdownMenuItem(child: Text("Kentucky"), value: "Kentucky"),
  DropdownMenuItem(child: Text("Louisiana"), value: "Louisiana"),
  DropdownMenuItem(child: Text("Maine"), value: "Maine"),
  DropdownMenuItem(child: Text("Maryland"), value: "Maryland"),
  DropdownMenuItem(child: Text("Massachussetts"), value: "Massachuessetts"),
  DropdownMenuItem(child: Text("Michigan"), value: "Michigan"),
  DropdownMenuItem(child: Text("Minnesota"), value: "Minnesota"),
  DropdownMenuItem(child: Text("Mississippi"), value: "Mississippi"),
  DropdownMenuItem(child: Text("Missouri"), value: "Missouri"),
  DropdownMenuItem(child: Text("Montana"), value: "Montana"),
  DropdownMenuItem(child: Text("Nebraska"), value: "Nebraska"),
  DropdownMenuItem(child: Text("Nevada"), value: "Nevada"),
  DropdownMenuItem(child: Text("New Hampshire"), value: "New Hampshire"),
  DropdownMenuItem(child: Text("New Jersey"), value: "New Jersey"),
  DropdownMenuItem(child: Text("New Mexico"), value: "New Mexico"),
  DropdownMenuItem(child: Text("New York"), value: "New York"),
  DropdownMenuItem(child: Text("North Carolina"), value: "North Carolina"),
  DropdownMenuItem(child: Text("North Dakota"), value: "North Dakota"),
  DropdownMenuItem(child: Text("Ohio"), value: "Ohio"),
  DropdownMenuItem(child: Text("Oklahoma"), value: "Oklahoma"),
  DropdownMenuItem(child: Text("Oregon"), value: "Oregon"),
  DropdownMenuItem(child: Text("Pennsylvania"), value: "Pennsylvania"),
  DropdownMenuItem(child: Text("Rhode Island"), value: "Rhode Island"),
  DropdownMenuItem(child: Text("South Carolina"), value: "South Carolina"),
  DropdownMenuItem(child: Text("South Dakota"), value: "South Dakota"),
  DropdownMenuItem(child: Text("Tennessee"), value: "Tennesee"),
  DropdownMenuItem(child: Text("Texas"), value: "Texas"),
  DropdownMenuItem(child: Text("Utah"), value: "Utah"),
  DropdownMenuItem(child: Text("Vermont"), value: "Vermont"),
  DropdownMenuItem(child: Text("Virginia"), value: "Virginia"),
  DropdownMenuItem(child: Text("Washington"), value: "Washington"),
  DropdownMenuItem(child: Text("West Virginia"), value: "West Virginia"),
  DropdownMenuItem(child: Text("Wisconsin"), value: "Wisconsin"),
  DropdownMenuItem(child: Text("Wyoming"), value: "Wyoming"),
  DropdownMenuItem(child: Text("Other"), value: "Other"),
];
