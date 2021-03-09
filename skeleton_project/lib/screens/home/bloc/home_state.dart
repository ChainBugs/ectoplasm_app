part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int timesPushed;
  final int counter;

  HomeState({
    this.timesPushed,
    this.counter,
  });

  HomeState copyWith({
    int timesPushed,
    int counter,
  }) {
    return HomeState(
      timesPushed: timesPushed ?? this.timesPushed,
      counter: counter ?? this.counter,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [timesPushed, counter];
}
