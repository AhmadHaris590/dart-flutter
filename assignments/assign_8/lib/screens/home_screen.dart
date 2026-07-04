import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/featured_news_card.dart';
import '../widgets/news_list_item_tile.dart';
import '../widgets/status_metric_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome, ${MockData.userFirstName}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Your academic architect dashboard is ready.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
          ),
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: GpaStatusCard(gpa: MockData.gpa.toStringAsFixed(2))),
                const SizedBox(width: 12),
                Expanded(
                  child: NextClassStatusCard(
                    courseCode: MockData.nextClassCode,
                    detailLine: MockData.nextClassTime,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Campus News',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary),
              ),
              TextButton(onPressed: () {}, child: const Text('View All')),
            ],
          ),
          const SizedBox(height: 10),
          FeaturedNewsCard(news: MockData.featuredNews),
          const SizedBox(height: 14),
          Card(
            elevation: 1,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                children: [
                  for (var i = 0; i < MockData.campusNews.length; i++) ...[
                    if (i > 0) Divider(height: 1, color: Colors.grey.shade200),
                    NewsListItemTile(item: MockData.campusNews[i]),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}