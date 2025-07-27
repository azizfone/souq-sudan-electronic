import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'choose_user_type.dart';

class AdminPanel extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isAdmin');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => ChooseUserType()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // هذه بيانات وهمية مؤقتًا
    int totalAds = 120;
    int approvedAds = 80;
    int pendingAds = 40;
    int totalUsers = 300;

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('إحصائيات عامة:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildStatCard('عدد الإعلانات الكلي', totalAds, Colors.blue),
            _buildStatCard('عدد الإعلانات المقبولة', approvedAds, Colors.green),
            _buildStatCard('الإعلانات بانتظار الموافقة', pendingAds, Colors.orange),
            _buildStatCard('عدد المستخدمين', totalUsers, Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int number, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(number.toString(), style: TextStyle(color: Colors.white)),
        ),
        title: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
