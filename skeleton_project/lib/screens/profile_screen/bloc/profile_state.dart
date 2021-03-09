part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final List<DnDClass> classes;

  ProfileState({this.classes});
  @override
  List<Object> get props => [classes];
}
