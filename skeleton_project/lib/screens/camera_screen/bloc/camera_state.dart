part of 'camera_bloc.dart';

class CameraState extends Equatable {
  final CameraPhase phase;

  CameraState({this.phase});

  CameraState copyWith({phase}) {
    return CameraState(phase: phase ?? this.phase);
  }

  @override
  List<Object> get props => [phase];
}

enum CameraPhase { scanPhase, defaultPhase }
