part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final List<DnDClass> classes;

  ProfileState({this.classes});

  ProfileState copyWith({List<DnDClass> classes}) {
    return ProfileState(classes: classes ?? this.classes);
  }

  @override
  List<Object> get props => [classes];
}
