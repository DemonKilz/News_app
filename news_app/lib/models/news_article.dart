class NewsArticle {
  final String title;
  final String description;
  final String? imageUrl;
  final String? url; // Add this field for full article link

  NewsArticle({
    required this.title,
    required this.description,
    this.imageUrl,
    this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['urlToImage'],  // Fix: Ensure correct key
      url: json['url'],  // Fix: Add this field
    );
  }
}
