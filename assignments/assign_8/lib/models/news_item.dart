class NewsItem {
  const NewsItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
}

class FeaturedNews {
  const FeaturedNews({
    required this.tag,
    required this.headline,
    required this.summary,
    required this.imageUrl,
  });

  final String tag;
  final String headline;
  final String summary;
  final String imageUrl;
}