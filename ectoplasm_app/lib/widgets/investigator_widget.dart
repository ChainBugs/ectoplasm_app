import 'package:flutter/material.dart';
import 'package:skeleton_project/screens/card_screen/bloc/card_bloc.dart';

class InvestigatorCard extends StatelessWidget {
  final CardState state;
  const InvestigatorCard(this.state);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Name: ${state.investigator?.name}" ?? ""),
          SizedBox(height: 50),
          Text("Role: ${state.investigator?.role}" ?? ""),
          SizedBox(height: 50),
          Text("Birthplace: ${state.investigator?.birthplace}" ?? ""),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}
