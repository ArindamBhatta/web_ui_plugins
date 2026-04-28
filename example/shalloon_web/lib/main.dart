import 'package:flutter/material.dart';
import 'package:web_ui_plugins/web_ui_plugins.dart';

import 'app/bootstrap.dart';
import 'home/shell_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Run the bootstrap — this initializes Firebase, sets up the user, and registers plugins.
    await ShalloonBootstrap.run(useEmulators: true);

    runApp(
      AppBootstrap.buildRouterApp(
        title: 'Shalloon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        shellBuilder: (context, child) => ShalloonShell(child: child),
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
