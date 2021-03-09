import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/repositories/dnd_repository.dart';
import 'package:skeleton_project/screens/profile_screen/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final DnDRepository dnDRepository;

  ProfileScreen(this.dnDRepository);

  static const routeName = "/profile_screen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(this.dnDRepository),
      child: _ProfileScreenContent(),
    );
  }
}

class _ProfileScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Profile Screen"),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('This is the Profile page'),
                  SizedBox(height: 50),
                  Text('Another Text')
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
