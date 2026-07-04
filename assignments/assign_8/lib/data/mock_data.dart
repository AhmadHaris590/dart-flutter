import '../models/news_item.dart';
import '../models/product.dart';

abstract final class MockData {
  static const String userFirstName = 'Jordan';
  static const String profileName = 'Alex Harrison';
  static const String studentId = 'UB-9213471';
  static const double gpa = 3.82;
  static const String nextClassCode = 'CS 401';
  static const String nextClassTime = '10:30 AM • Hall B';

  static const int marketplaceItemCount = 428;

  static const FeaturedNews featuredNews = FeaturedNews(
    tag: 'ACADEMIC',
    headline: 'New Research Grant Awarded to Engineering Faculty',
    summary:
        'The university announced a major grant supporting sustainable infrastructure '
        'research. Faculty and graduate students will collaborate across departments '
        'on next-generation materials and energy systems...',
    imageUrl: 'https://images.unsplash.com/photo-1564981797816-1043664bf78d?w=800&q=80',
  );

  static const List<NewsItem> campusNews = [
    NewsItem(
      title: 'Registration for Fall Semester Opens Soon',
      subtitle: 'Check your enrollment window and plan your courses.',
      imageUrl: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=200&q=80',
    ),
    NewsItem(
      title: 'Library Hours Extended During Finals',
      subtitle: 'Quiet study zones and 24/7 access in the main reading room.',
      imageUrl: 'https://images.unsplash.com/photo-1521587760476-6c12a4b0402b?w=200&q=80',
    ),
    NewsItem(
      title: 'Career Fair: Tech & Startups',
      subtitle: 'Meet recruiters this Thursday at the student union.',
      imageUrl: 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=200&q=80',
    ),
  ];

  static const List<Product> products = [
    Product(
      title: 'Fundamentals of Algorithms',
      category: 'Computer Science Dept.',
      priceLabel: r'$45.00',
      statusBadge: 'LIKE NEW',
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&q=80',
    ),
    Product(
      title: 'MacBook Pro 14" M1',
      category: 'Tech & Gadgets',
      priceLabel: r'$850.00',
      statusBadge: '2022 MODEL',
      imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd2388?w=400&q=80',
    ),
    Product(
      title: 'Modern Sociology Vol. 1',
      category: 'Social Sciences',
      priceLabel: r'$25.00',
      statusBadge: 'ANNOTATED',
      imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&q=80',
    ),
    Product(
      title: 'Mechanical Keyboard',
      category: 'Accessories',
      priceLabel: r'$65.00',
      statusBadge: 'WIRELESS',
      imageUrl: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400&q=80',
    ),
    Product(
      title: 'Smartwatch Series 6',
      category: 'Wearables',
      priceLabel: r'$120.00',
      statusBadge: 'UNBOXED',
      imageUrl: 'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?w=400&q=80',
    ),
    Product(
      title: 'Graphing Calculator',
      category: 'Math & Science',
      priceLabel: r'$15.00',
      statusBadge: 'ESSENTIAL',
      imageUrl: 'https://images.unsplash.com/photo-1587145820266-a5951ee6f620?w=400&q=80',
    ),
  ];

  static const List<String> departments = [
    'Computer Science & Engineering',
    'Electrical Engineering',
    'Business Administration',
    'Mathematics',
  ];
}