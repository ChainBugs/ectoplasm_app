import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_project/screens/camera_screen/bloc/camera_bloc.dart';
import 'package:skeleton_project/widgets/app_widgets.dart';

class CameraScreen extends StatelessWidget {
  static const routeName = "/camera_screen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraBloc>(
      create: (context) => CameraBloc(),
      child: _CameraScreenContent(),
    );
  }
}

class _CameraScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Screen"),
      ),
      body: BlocListener<CameraBloc, CameraState>(
        listener: (context, state) {},
        child: BlocBuilder<CameraBloc, CameraState>(
          builder: (context, state) {
            return Column(children: <Widget>[
              Text('LAUNCH CAMERA'),
              AppButton(),
            ]);
          },
        ),
      ),
    );
  }
}
