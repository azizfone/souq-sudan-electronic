import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  List<Map<String, String>> posts = [
    {
      'title': 'سيارة تويوتا',
      'desc': 'تويوتا موديل 2015 حالة ممتازة',
      'price': '6,000,000',
    },
    {
      'title': 'منزل في امدرمان',
      'desc': 'منزل 3 غرف ومطبخ في حي النصر',
      'price': '18,000,000',
    },
  ];

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حذف الإعلان')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لوحة تحكم المشرف'),
        centerTitle: true,
      ),
      body: posts.isEmpty
          ? Center(child: Text('لا توجد إعلانات حالياً'))
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(post['title']!),
                    subtitle: Text('السعر: ${post['price']} SDG\n${post['desc']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deletePost(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
