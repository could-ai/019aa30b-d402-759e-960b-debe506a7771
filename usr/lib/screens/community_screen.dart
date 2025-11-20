import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المجتمع العلمي'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('غرف تخصصية'),
          _buildChatRoomTile(
            context,
            'علوم الفضاء والفلك',
            '1.2k عضو',
            Icons.public,
            Colors.purple,
          ),
          _buildChatRoomTile(
            context,
            'الفيزياء النظرية',
            '850 عضو',
            Icons.all_inclusive,
            Colors.blue,
          ),
          _buildChatRoomTile(
            context,
            'البيولوجيا والطب',
            '2.1k عضو',
            Icons.biotech,
            Colors.green,
          ),
          
          const SizedBox(height: 24),
          _buildSectionHeader('نقاشات نشطة الآن'),
          _buildDiscussionItem(
            'هل يمكن للحياة أن توجد على أقمار المشتري؟',
            'د. محمد • منذ 15 دقيقة',
            54,
          ),
          _buildDiscussionItem(
            'آخر تطورات الاندماج النووي',
            'سارة علي • منذ 30 دقيقة',
            32,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildChatRoomTile(BuildContext context, String title, String subtitle, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: const Text('انضمام'),
        ),
      ),
    );
  }

  Widget _buildDiscussionItem(String title, String subtitle, int replies) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              const Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey),
              Text('$replies', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
