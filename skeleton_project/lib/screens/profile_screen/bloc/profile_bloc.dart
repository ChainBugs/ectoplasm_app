import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:skeleton_project/models/dndClass.dart';
import 'package:skeleton_project/repositories/dnd_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DnDRepository dnDRepository;

  ProfileBloc(this.dnDRepository) : super(ProfileState(classes: [])) {
    add(ProfileInitialEvent());
  }

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileInitialEvent) {
      // do something
    }
  }
}
