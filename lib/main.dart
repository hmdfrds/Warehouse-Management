
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/screens/main_screen.dart';
import 'package:warehouse/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: kIsWeb ? MainScreen() : SplashScreen(),
    );
  }
}
