part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class CardInitialEvent extends CardEvent {
  final String investigatorID;
  CardInitialEvent(this.investigatorID);
}