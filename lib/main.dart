import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'choose_user_type.dart';

class AdminPanel extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isAdmin'); // نحذف علامة الدخول

    // نرجع المستخدم إلى شاشة الاختيار
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => ChooseUserType()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لوحة تحكم المشرف'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'تسجيل الخروج',
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: Center(
        child: Text(
          'مرحباً بك في لوحة التحكم',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
