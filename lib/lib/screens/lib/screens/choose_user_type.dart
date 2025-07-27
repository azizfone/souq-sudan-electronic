import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'admin_panel.dart';

class ChooseUserType extends StatelessWidget {
  final adminPassword = '0912323767Aa'; // 🔐 كلمة سر المشرف

  void _showAdminLoginDialog(BuildContext context) {
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
            onPressed: () {
              if (_passwordController.text == adminPassword) {
                Navigator.pop(context); // اغلق النافذة
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AdminPanel()),
                );
              } else {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر نوع الدخول'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('من فضلك اختر نوع المستخدم:', style: TextStyle(fontSize: 20)),
              SizedBox(height: 30),
              ElevatedButton.icon(
                icon: Icon(Icons.person),
                label: Text('دخول كمستخدم'),
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.lock),
                label: Text('دخول كمشرف'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(200, 50),
                ),
                onPressed: () => _showAdminLoginDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
