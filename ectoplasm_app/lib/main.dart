import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_project/repositories/dnd_repository.dart';
import 'package:skeleton_project/repositories/ghost_repository.dart';
import 'package:skeleton_project/repositories/investigator_repository.dart';
import 'package:skeleton_project/screens/camera_screen/camera_screen.dart';
import 'package:skeleton_project/screens/card_screen/card_screen.dart';
import 'package:skeleton_project/screens/home/home_screen.dart';
import 'package:skeleton_project/screens/profile_screen/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final dndRepository = DnDRepository("www.dnd5eapi.co");
  final ghostRepository = GhostRepository();
  final investigatorRepository = InvestigatorRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text("ENROR"),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.indigo,
            ),
            initialRoute: HomeScreen.routeName,
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              ProfileScreen.routeName: (context) =>
                  ProfileScreen(dndRepository),
              CameraScreen.routeName: (context) => CameraScreen(),
              CardScreen.routeName: (context) =>
                  CardScreen(ghostRepository, investigatorRepository),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          child: Text("Loading?"),
        );
      },
    );
  }
}
