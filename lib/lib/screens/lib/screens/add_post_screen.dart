import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _phoneController = TextEditingController();
  String _category = 'سيارات';

  final List<String> _categories = [
    'سيارات',
    'عقارات',
    'موبايلات',
    'إلكترونيات',
    'وظائف',
    'أخرى',
  ];

  void _submitPost() {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();
    final price = _priceController.text.trim();
    final phone = _phoneController.text.trim();

    if (title.isEmpty || desc.isEmpty || price.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى تعبئة جميع الحقول')),
      );
      return;
    }

    // هنا ترسل البيانات إلى Firebase أو تحفظها
    print('تم نشر الإعلان: $title | $_category | $price SDG');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم نشر الإعلان بنجاح')),
    );

    // مسح الحقول بعد الإرسال
    _titleController.clear();
    _descController.clear();
    _priceController.clear();
    _phoneController.clear();
    setState(() {
      _category = 'سيارات';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة إعلان جديد'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'عنوان الإعلان'),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'وصف الإعلان'),
              maxLines: 3,
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'السعر'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'رقم الهاتف'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _category,
              items: _categories.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _category = val!;
                });
              },
              decoration: InputDecoration(labelText: 'الفئة'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('نشر الإعلان'),
            ),
          ],
        ),
      ),
    );
  }
}
