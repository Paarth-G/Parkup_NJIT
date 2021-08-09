import 'carModel.dart';

class Pass {
  final String parkingLot;
  final String address;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final Car car;
  Pass(this.parkingLot, this.address, this.type, this.startDate, this.endDate,
      this.car);
}

List<Pass> kPasses = [];
