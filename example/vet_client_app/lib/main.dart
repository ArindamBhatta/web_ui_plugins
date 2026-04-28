import 'package:flutter/material.dart';
import 'package:vet_application/home/vet_application.dart';

import 'package:web_ui_plugins/web_ui_plugins.dart';

import 'app/vet_application_bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    //initializes Firebase, sets up the user, and registers plugins.
    await VetApplicationBootstrap.run(useEmulators: true);

    runApp(
      AppBootstrap.buildRouterApp(
        title: 'Shalloon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        shellBuilder: (context, child) => VetApplication(child: child),
      ),
    );
  } catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(body: Center(child: Text('Initialization failed: $e'))),
      ),
    );
  }
}
