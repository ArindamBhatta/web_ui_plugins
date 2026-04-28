import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_ui_plugins/web_ui_plugins.dart';

import '../view/pet_owner_plugin.dart';
import '../view/doctor_plugin.dart';

/// Optional Firebase config for connecting this example app to a different
/// Firebase project without editing package-level generated files.
class VetFirebaseApiConfig {
  final String apiKey;
  final String appId;
  final String messagingSenderId;
  final String projectId;
  final String? authDomain;
  final String? storageBucket;
  final String? measurementId;

  const VetFirebaseApiConfig({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    this.authDomain,
    this.storageBucket,
    this.measurementId,
  });

  bool get isComplete =>
      apiKey.trim().isNotEmpty &&
      appId.trim().isNotEmpty &&
      messagingSenderId.trim().isNotEmpty &&
      projectId.trim().isNotEmpty;

  FirebaseOptions toFirebaseOptions() {
    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      authDomain: authDomain,
      storageBucket: storageBucket,
      measurementId: measurementId,
    );
  }
}

/// All app wiring in one place.
/// main.dart calls [VetApplicationBootstrap.run].

class VetApplicationBootstrap {
  /// Private constructor to prevent instantiation.
  VetApplicationBootstrap._();

  /// Local setup for development — initializes Firebase, sets a dev user, and registers plugins.
  static Future<void> run({
    bool useEmulators = false,
    VetFirebaseApiConfig? firebaseConfig,
  }) async {
    if (firebaseConfig != null && !firebaseConfig.isComplete) {
      throw ArgumentError(
        'Incomplete firebaseConfig. Provide apiKey, appId, '
        'messagingSenderId, and projectId.',
      );
    }

    final firebaseOptions = firebaseConfig?.toFirebaseOptions();

    // Step 1: Initialize framework + Firebase
    await AppBootstrap.initialize(
      config: BootstrapConfig(
        initializeFirebase: () async {
          await Firebase.initializeApp(options: firebaseOptions);
          if (useEmulators) {
            FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
            FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
            // Firestore rules require request.auth != null.
            // For local dev with emulators, ensure a signed-in Firebase user.
            if (FirebaseAuth.instance.currentUser == null) {
              await FirebaseAuth.instance.signInAnonymously();
            }
          }
        },
        defaultPermissionPolicy: const OpenPermissionPolicy(),
      ),
    );

    // Step 2: Set active user (replace with real auth state listener)
    PermissionMiddleware.instance.setUser(
      const UserIdentity(
        userId: 'dev-user',
        persona: 'admin', // ShalloonPersona.admin.label
        email: 'dev@shalloon.app',
      ),
    );

    // Step 3: Register plugins — this is the entire app configuration
    await AppBootstrap.registerPlugins([doctorsPlugin, petOwnerPlugin]);
  }
}
