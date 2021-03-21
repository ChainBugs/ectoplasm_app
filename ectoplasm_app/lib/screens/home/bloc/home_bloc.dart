import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          HomeState(
            counter: 0,
            timesPushed: 0,
          ),
        );

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeIncrementEvent) {
      final newState = state.copyWith(
        counter: state.counter + 1,
        timesPushed: state.timesPushed + 1,
      );
      yield newState;
    } else if (event is HomeDecrementEvent) {
      final newState = state.copyWith(
        counter: state.counter - 1,
        timesPushed: state.timesPushed + 1,
      );
      yield newState;
    }
  }
}
