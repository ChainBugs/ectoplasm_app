part of 'card_bloc.dart';

class CardState extends Equatable {
  final Investigator investigator;

  const CardState({this.investigator});

  CardState copyWith({investigator}) {
    return CardState(investigator: investigator ?? this.investigator);
  }

  @override
  List<Object> get props => [];
}
