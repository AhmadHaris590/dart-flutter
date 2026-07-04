import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/marketplace_filter_chips.dart';
import '../widgets/product_card.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  static const _filters = ['All Items', 'Textbooks', 'Laptops'];
  int _selectedFilter = 0;

  List<int> _visibleIndices() {
    if (_selectedFilter == 0) {
      return List.generate(MockData.products.length, (i) => i);
    }
    if (_selectedFilter == 1) {
      return [0, 2];
    }
    return [1, 4];
  }

  @override
  Widget build(BuildContext context) {
    final indices = _visibleIndices();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CAMPUS ECONOMY',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Marketplace',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.textPrimary),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.tabHighlight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${MockData.marketplaceItemCount} Items',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              MarketplaceFilterChips(
                labels: _filters,
                selectedIndex: _selectedFilter,
                onSelected: (i) => setState(() => _selectedFilter = i),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 88),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemCount: indices.length,
              itemBuilder: (context, i) {
                final product = MockData.products[indices[i]];
                return ProductCard(product: product);
              },
            ),
          ),
        ),
      ],
    );
  }
}