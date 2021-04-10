import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skeleton_project/models/ghost.dart';
import 'package:skeleton_project/models/investigator.dart';
import 'package:skeleton_project/repositories/ghost_repository.dart';
import 'package:skeleton_project/repositories/investigator_repository.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  // ignore: unused_field
  final GhostRepository _ghostRepository;
  final InvestigatorRepository _investigatorRepository;
  final List<String> qrList;

  CardBloc(this._ghostRepository, this._investigatorRepository, {this.qrList})
      : super(CardState(
          ghost: Ghost(gender: "", name: "", region: ""),
          investigator: Investigator(
            name: "",
            birthplace: "",
            role: "",
          ),
        )) {
    add(CardInitialEvent(qrList));
  }

  @override
  Stream<CardState> mapEventToState(
    CardEvent event,
  ) async* {
    if (event is CardInitialEvent) {
      if (qrList[0] == "investigators") {
        final investigator =
            await _investigatorRepository.getInvestigator(event.qrList[1]);
        print("jag är en investigator $investigator");
        yield state.copyWith(
            investigator: investigator,
            activeCategory: ActiveCategory.investigators);
      }
      if (qrList[0] == "ghosts") {
        final ghost = await _ghostRepository.getGhost(event.qrList[1]);
        print("jag är ett spöke $ghost");
        yield state.copyWith(
            ghost: ghost, activeCategory: ActiveCategory.ghosts);
      }
    }
  }
}
