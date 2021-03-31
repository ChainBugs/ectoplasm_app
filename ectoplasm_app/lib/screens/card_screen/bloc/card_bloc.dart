import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skeleton_project/models/investigator.dart';
import 'package:skeleton_project/repositories/ghost_repository.dart';
import 'package:skeleton_project/repositories/investigator_repository.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  // ignore: unused_field
  final GhostRepository _ghostRepository;
  final InvestigatorRepository _investigatorRepository;
  final String investigatorID;

  CardBloc(this._ghostRepository, this._investigatorRepository,
      {this.investigatorID})
      : super(CardState()) {
    add(CardInitialEvent(investigatorID));
  }

  @override
  Stream<CardState> mapEventToState(
    CardEvent event,
  ) async* {
    if (event is CardInitialEvent) {
      final investigator =
          await _investigatorRepository.getInvestigator(event.investigatorID);
      yield state.copyWith(investigator: investigator);
    }
  }
}
