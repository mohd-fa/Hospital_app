import 'package:doctor_appointment_ui/screens/auth_page.dart';
import 'package:doctor_appointment_ui/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './screens/mainhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: "mainhomepage",
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
