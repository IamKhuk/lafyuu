import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/src/ui/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        canvasColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
