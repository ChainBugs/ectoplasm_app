import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/repositories/ghost_repository.dart';
import 'package:skeleton_project/repositories/investigator_repository.dart';
import 'package:skeleton_project/screens/card_screen/bloc/card_bloc.dart';

class CardScreen extends StatelessWidget {
  final GhostRepository ghostRepository;
  final InvestigatorRepository investigatorRepository;

  CardScreen(this.ghostRepository, this.investigatorRepository);

  static const routeName = "/card_screen";
  @override
  Widget build(BuildContext context) {
    final params =
        ModalRoute.of(context).settings.arguments as CardScreenArguments;
    return BlocProvider<CardBloc>(
      create: (context) => CardBloc(
        this.ghostRepository,
        this.investigatorRepository,
        investigatorID: params.qrCode,
      ),
      child: _CardScreenContent(),
    );
  }
}

class CardScreenArguments {
  final String qrCode;

  CardScreenArguments({this.qrCode});
}

class _CardScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("The Card Screen"),
      ),
      body: BlocListener<CardBloc, CardState>(
        listener: (context, state) {},
        child: BlocBuilder<CardBloc, CardState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Name: ${state.investigator?.name}" ?? ""),
                  SizedBox(height: 50),
                  Text("Role: ${state.investigator?.role}" ?? ""),
                  SizedBox(height: 50),
                  Text("Birthplace: ${state.investigator?.birthplace}" ?? ""),
                  SizedBox(height: 20),
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.deepPurple,
                    child: Text(
                      args.qrCode,
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
