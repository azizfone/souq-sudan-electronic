import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'admin_panel.dart';

class ChooseUserType extends StatefulWidget {
  @override
  _ChooseUserTypeState createState() => _ChooseUserTypeState();
}

class _ChooseUserTypeState extends State<ChooseUserType> {
  final adminPassword = '0912323767Aa';

  @override
  void initState() {
    super.initState();
    _checkIfAdminLoggedIn();
  }

  Future<void> _checkIfAdminLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isAdmin = prefs.getBool('isAdmin') ?? false;

    if (isAdmin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => AdminPanel()),
      );
    }
  }

  void _showAdminLoginDialog() {
    final TextEditingController _passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('تسجيل دخول المشرف'),
        content: TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'أدخل كلمة السر'),
        ),
        actions: [
          TextButton(
            child: Text('إلغاء'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text('دخول'),
            onPressed: () async {
              if (_passwordController.text == adminPassword) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isAdmin', true);

                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AdminPanel()),
                );
              } else {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('كلمة السر غير صحيحة')),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _goToUserHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اختر نوع الدخول')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text('دخول كمستخدم'),
              onPressed: _goToUserHome,
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.lock),
              label: Text('دخول كمشرف'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(200, 50),
              ),
              onPressed: _showAdminLoginDialog,
            ),
          ],
        ),
      ),
    );
  }
}
