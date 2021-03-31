import 'package:equatable/equatable.dart';

class Investigator extends Equatable {
  final String name;
  final String role;
  final String birthplace;
  Investigator({this.name, this.role, this.birthplace});

  factory Investigator.fromFirebaseDocument(Map<String, dynamic> document) {
    return Investigator(
      name: document["name"],
      role: document["role"],
      birthplace: document["birthplace"],
    );
  }

  Investigator copyWith(String name, String role, String birthplace) {
    return Investigator(
      name: name ?? this.name,
      role: role ?? this.role,
      birthplace: birthplace ?? this.birthplace,
    );
  }

  @override
  List<Object> get props => [name, role, birthplace];
}
