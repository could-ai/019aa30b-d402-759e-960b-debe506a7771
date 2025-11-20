import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'المسؤول (Admin)',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'afssd389@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            
            _buildStatRow(),
            
            const SizedBox(height: 24),
            _buildMenuTile(Icons.bookmark_outline, 'المقالات المحفوظة'),
            _buildMenuTile(Icons.history, 'سجل البحث'),
            _buildMenuTile(Icons.notifications_outlined, 'الإشعارات'),
            _buildMenuTile(Icons.language, 'اللغة'),
            _buildMenuTile(Icons.help_outline, 'المساعدة والدعم'),
            
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                child: const Text('تسجيل الخروج'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('12', 'مقال'),
        _buildStatItem('45', 'متابِع'),
        _buildStatItem('8', 'مجموعات'),
      ],
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMenuTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
