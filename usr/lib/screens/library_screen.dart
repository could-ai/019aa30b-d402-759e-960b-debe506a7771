import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المكتبة الذكية'),
      ),
      body: Column(
        children: [
          // Search Area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'ابحث في arXiv, PubMed, CrossRef...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip(context, 'الكل', true),
                      _buildFilterChip(context, 'فيزياء', false),
                      _buildFilterChip(context, 'فضاء', false),
                      _buildFilterChip(context, 'أحياء', false),
                      _buildFilterChip(context, 'كيمياء', false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Results Area
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'أوراق بحثية رائجة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildPaperItem(
                  'Gravitational Waves from Merging Black Holes',
                  'B.P. Abbott et al.',
                  'arXiv:1602.03837',
                  'Physics',
                ),
                _buildPaperItem(
                  'The CRISPR-Cas9 System for Genome Editing',
                  'Jennifer A. Doudna',
                  'PubMed: 256789',
                  'Biology',
                ),
                _buildPaperItem(
                  'Deep Learning in Neural Networks',
                  'Yann LeCun',
                  'CrossRef: 10.1038',
                  'Computer Science',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedColor: Theme.of(context).colorScheme.primary,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }

  Widget _buildPaperItem(String title, String author, String source, String tag) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(color: Colors.blue, fontSize: 10),
                  ),
                ),
                const Spacer(),
                Text(
                  source,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              author,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download_rounded, size: 18),
                  label: const Text('تحميل PDF'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
