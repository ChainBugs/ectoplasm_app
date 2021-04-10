import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/repositories/ghost_repository.dart';
import 'package:skeleton_project/repositories/investigator_repository.dart';
import 'package:skeleton_project/screens/card_screen/bloc/card_bloc.dart';
import 'package:skeleton_project/widgets/ghost_widget.dart';
import 'package:skeleton_project/widgets/investigator_widget.dart';

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
        qrList: params.qrList,
      ),
      child: _CardScreenContent(),
    );
  }
}

class CardScreenArguments {
  final List<String> qrList;
  CardScreenArguments({this.qrList});
}

class _CardScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Card Screen"),
      ),
      body: BlocListener<CardBloc, CardState>(
        listener: (context, state) {},
        child: BlocBuilder<CardBloc, CardState>(
          builder: (context, state) {
            if (state.activeCategory == ActiveCategory.investigators) {
              return InvestigatorCard(state);
            }
            if (state.activeCategory == ActiveCategory.ghosts) {
              return GhostCard(state);
            } else {
              return Container(
                child: Text("UNEXPECTED ERROR"),
              );
            }
          },
        ),
      ),
    );
  }
}
