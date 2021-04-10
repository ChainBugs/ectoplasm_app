import 'package:flutter/material.dart';
import 'package:skeleton_project/screens/card_screen/bloc/card_bloc.dart';

class GhostCard extends StatelessWidget {
  final CardState state;
  const GhostCard(this.state);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Name: ${state.ghost?.name}" ?? ""),
          SizedBox(height: 50),
          Text("Gender: ${state.ghost?.gender}" ?? ""),
          SizedBox(height: 50),
          Text("Region: ${state.ghost?.region}" ?? ""),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}
