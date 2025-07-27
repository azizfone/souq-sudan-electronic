import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'admin_panel.dart';

class ChooseUserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مرحبا بك في سوق السودان'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'من فضلك اختر نوع الدخول:',
                style: TextStyle(fontSize: 20),
              ),
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
                icon: Icon(Icons.admin_panel_settings),
                label: Text('دخول كمشرف'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => AdminPanel()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
