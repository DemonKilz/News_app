import 'package:flutter/material.dart';
import '../models/news_article.dart';
import 'package:url_launcher/url_launcher.dart'; // To open full article

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle newsItem;

  const NewsDetailScreen({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            newsItem.imageUrl != null && Uri.tryParse(newsItem.imageUrl!)?.hasAbsolutePath == true
                ? Image.network(
                    newsItem.imageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child; // If done loading, show image
                      return const Center(child: CircularProgressIndicator()); // Show loader while loading
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/placeholder.png');
                    },
                  )
                : Image.asset('assets/images/placeholder.png'),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsItem.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsItem.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            newsItem.url != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(newsItem.url!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else if (context.mounted){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Could not open article")),
                          );
                        }
                      },
                      child: const Text("Read Full Article"),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
