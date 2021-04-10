part of 'card_bloc.dart';

class CardState extends Equatable {
  final Ghost ghost;
  final Investigator investigator;
  final ActiveCategory activeCategory;

  const CardState({this.investigator, this.ghost, this.activeCategory});

  CardState copyWith({investigator, ghost, activeCategory}) {
    return CardState(
      investigator: investigator ?? this.investigator,
      ghost: ghost ?? this.ghost,
      activeCategory: activeCategory ?? this.activeCategory,
    );
  }

  @override
  List<Object> get props => [investigator, ghost, activeCategory];
}

enum ActiveCategory {
  ghosts,
  investigators,
}
