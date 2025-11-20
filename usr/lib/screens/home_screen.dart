import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Mock User - In a real app, this comes from Auth Provider
  final String currentUserEmail = 'afssd389@gmail.com';
  final String adminEmail = 'afssd389@gmail.com';

  @override
  Widget build(BuildContext context) {
    bool isAdmin = currentUserEmail == adminEmail;

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: LogoWidget(size: 30),
        ),
        title: const Text('أحدث الاكتشافات'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: isAdmin
          ? FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('فتح واجهة النشر (للمسؤول فقط)')),
                );
              },
              label: const Text('نشر مقال'),
              icon: const Icon(Icons.edit),
              backgroundColor: Theme.of(context).colorScheme.primary,
            )
          : null,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildFeaturedCard(context),
          const SizedBox(height: 20),
          const Text(
            'مقالات مختارة',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildArticleItem(
            context,
            'تطور الثقوب السوداء في الكون المبكر',
            'د. أحمد العالم',
            'فيزياء فلكية',
            '2 ساعة مضت',
            Colors.deepPurple.shade900,
          ),
          _buildArticleItem(
            context,
            'تأثير الذكاء الاصطناعي على البحث العلمي',
            'سارة الباحثة',
            'تكنولوجيا',
            '5 ساعات مضت',
            Colors.blue.shade900,
          ),
          _buildArticleItem(
            context,
            'استكشاف المريخ: تحديات وفرص',
            'وكالة الفضاء',
            'علوم الفضاء',
            '1 يوم مضى',
            Colors.orange.shade900,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCard(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.purple.shade800, Colors.blue.shade800],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: const DecorationImage(
          image: NetworkImage('https://placeholder.com/space-banner'), // Placeholder
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'مقال مميز',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'مستقبل السفر بين النجوم',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, String title, String author,
      String category, String time, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.science, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Icon(Icons.person, size: 14, color: Colors.grey[400]),
              const SizedBox(width: 4),
              Text(author, style: TextStyle(fontSize: 12, color: Colors.grey[400])),
              const Spacer(),
              Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[400])),
            ],
          ),
        ),
        trailing: const Icon(Icons.verified, color: Colors.blue, size: 16),
      ),
    );
  }
}
