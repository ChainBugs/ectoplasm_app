import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/screens/camera_screen/camera_screen.dart';
import 'package:skeleton_project/screens/home/bloc/home_bloc.dart';
import 'package:skeleton_project/screens/profile_screen/profile_screen.dart';
import 'package:skeleton_project/widgets/app_widgets.dart';

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
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.timesPushed}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'The counter score is on:',
                  ),
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: AppButton(
                      text: "Go to another page",
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ProfileScreen.routeName);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: AppButton(
                      text: "Go to camera page",
                      onPressed: () {
                        Navigator.of(context).pushNamed(CameraScreen.routeName);
                      },
                    ),
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FloatingActionButton(
                            heroTag: 'btn1',
                            tooltip: 'Decrement',
                            onPressed: () {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(HomeDecrementEvent());
                            },
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            heroTag: 'btn2',
                            onPressed: () {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(HomeIncrementEvent());
                            },
                            tooltip: 'Increment',
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
