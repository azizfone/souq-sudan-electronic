import 'screens/admin_panel.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // ربط شاشة تسجيل الدخول

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سوق السودان الإلكتروني',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),
      home: AdminPanel(), // فتح شاشة تسجيل الدخول مباشرة
      debugShowCheckedModeBanner: false,
    );
  }
}
