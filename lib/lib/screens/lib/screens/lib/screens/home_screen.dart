import 'package:flutter/material.dart';
import 'add_post_screen.dart';

class HomeScreen extends StatelessWidget {
  void _goToAddPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPostScreen()),
    );
  }

  final List<Map<String, String>> dummyPosts = [
    {
      'title': 'سيارة تويوتا كورولا',
      'price': '6,500,000',
      'category': 'سيارات',
      'phone': '0912345678',
      'desc': 'سيارة نظيفة موديل 2015 بحالة ممتازة.'
    },
    {
      'title': 'منزل للبيع في بحري',
      'price': '28,000,000',
      'category': 'عقارات',
      'phone': '0923456789',
      'desc': 'منزل طابقين مسلح في حي هادئ.'
    },
    {
      'title': 'iPhone 12 Pro Max',
      'price': '550,000',
      'category': 'موبايلات',
      'phone': '0901122334',
      'desc': 'جهاز شبه جديد 128GB.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سوق السودان الإلكتروني'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _goToAddPost(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          final post = dummyPosts[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(post['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text("السعر: ${post['price']} SDG"),
                  Text("الفئة: ${post['category']}"),
                  Text("الهاتف: ${post['phone']}"),
                  SizedBox(height: 5),
                  Text("الوصف: ${post['desc']}"),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
