import 'package:cloud_firestore/cloud_firestore.dart';

class Pass {
  final String lot;
  final String address;
  final String type;
  final Timestamp starts;
  final Timestamp expires;
  final String plate;
  final DocumentReference reference;

  Pass.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['lot'] != null),
        assert(map['address'] != null),
        assert(map['type'] != null),
        assert(map['starts'] != null),
        assert(map['expires'] != null),
        assert(map['plate'] != null),
        this.lot = map['lot'],
        this.address = map['address'],
        this.type = map['type'],
        this.starts = map['starts'],
        this.expires = map['expires'],
        this.plate = map['plate'];

  Pass.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
