import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/screens/card_screen/bloc/card_bloc.dart';

class CardScreen extends StatelessWidget {
  static const routeName = "/card_screen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardBloc>(
      create: (context) => CardBloc(),
      child: _CardScreenContent(),
    );
  }
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('This is the Card page'),
                  SizedBox(height: 50),
                  Text('DnD Classes'),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
