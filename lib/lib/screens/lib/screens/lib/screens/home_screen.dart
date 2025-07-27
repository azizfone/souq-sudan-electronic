import 'package:flutter/material.dart';
import 'add_post_screen.dart';

class HomeScreen extends StatelessWidget {
  void _goToAddPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPostScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سوق السودان الإلكتروني'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'مرحبًا بك في سوق السودان!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _goToAddPost(context),
              icon: Icon(Icons.add),
              label: Text('إضافة إعلان جديد'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
