part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeIncrementEvent extends HomeEvent {}

class HomeDecrementEvent extends HomeEvent {}
