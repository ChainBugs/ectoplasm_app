import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/screens/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home_screen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Epic App"),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.timesPushed}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeDecrementEvent());
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(HomeIncrementEvent());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
