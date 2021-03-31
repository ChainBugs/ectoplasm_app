import 'package:equatable/equatable.dart';

class Ghost extends Equatable {
  final String name;
  final String gender;
  final String region;
  Ghost({this.name, this.gender, this.region});

  factory Ghost.fromFirebaseDocument(Map<String, dynamic> document) {
    return Ghost(
      name: document["name"],
      gender: document["gender"],
      region: document["region"],
    );
  }
  @override
  List<Object> get props => [name, gender, region];
}
