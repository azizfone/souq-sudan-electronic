import 'package:flutter/material.dart';

class ManageAdsScreen extends StatefulWidget {
  @override
  _ManageAdsScreenState createState() => _ManageAdsScreenState();
}

class _ManageAdsScreenState extends State<ManageAdsScreen> {
  List<Map<String, dynamic>> ads = [
    {
      'title': 'سيارة تويوتا للبيع',
      'description': 'موديل 2015 بحالة ممتازة',
      'isApproved': false,
    },
    {
      'title': 'هاتف سامسونج S21',
      'description': 'جديد بالكرتونة',
      'isApproved': true,
    },
  ];

  void _approveAd(int index) {
    setState(() {
      ads[index]['isApproved'] = true;
    });
  }

  void _deleteAd(int index) {
    setState(() {
      ads.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة الإعلانات'),
      ),
      body: ListView.builder(
        itemCount: ads.length,
        itemBuilder: (context, index) {
          final ad = ads[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(ad['title']),
              subtitle: Text(ad['description']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!ad['isApproved'])
                    IconButton(
                      icon: Icon(Icons.check_circle, color: Colors.green),
                      onPressed: () => _approveAd(index),
                      tooltip: 'قبول الإعلان',
                    ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteAd(index),
                    tooltip: 'حذف الإعلان',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
