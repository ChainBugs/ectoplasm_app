import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/models/dndClass.dart';
import 'package:skeleton_project/repositories/dnd_repository.dart';
import 'package:skeleton_project/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:skeleton_project/widgets/progressBalls.dart';

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
                  Text('DnD Classes'),
                  SizedBox(height: 20),
                  state.classes.length != 0
                      ? dndClassTileBuilder(state.classes)
                      : Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: ProgressBalls(
                            color: Colors.indigo,
                          )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget dndClassTileBuilder(List<DnDClass> classes) {
    final random = Random();
    return Container(
      height: 200,
      child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 35,
                width: 20,
                margin: EdgeInsets.only(left: 60, right: 60),
                color: Color.fromRGBO(
                  random.nextInt(200),
                  random.nextInt(200),
                  random.nextInt(200),
                  1,
                ),
                child: Center(
                  child: Text(
                    classes[index].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
