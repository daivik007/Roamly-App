import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const RoamlyApp());
}

class RoamlyApp extends StatelessWidget {
  const RoamlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roamly',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const LoginScreen(),
    );
  }
}

//todo