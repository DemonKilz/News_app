import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../screens/news_detail_screen.dart';
import '../models/news_article.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});
  @override
  NewsListScreenState createState() => NewsListScreenState();
}

class NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    
    // Fetch news after widget build to avoid "setState() called during build" error
    Future.microtask(() => 
      Provider.of<NewsProvider>(context, listen: false).fetchNews()
    );
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final List<NewsArticle> articles = newsProvider.articles;

    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: newsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : articles.isEmpty
              ? const Center(child: Text("No news available."))
              : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final newsItem = articles[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(newsItem: newsItem),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)), // Rounded corners
                              child: SizedBox(
                                height: 200, // Fixed height to ensure consistent alignment
                                width: double.infinity,
                                child: newsItem.imageUrl != null && newsItem.imageUrl!.isNotEmpty
                                    ? FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/placeholder.png',
                                        image: newsItem.imageUrl!,
                                        fit: BoxFit.fill,
                                        imageErrorBuilder: (context, error, stackTrace) {
                                          return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover);
                                        },
                                      )
                                    : Image.asset('assets/images/placeholder.png', fit: BoxFit.cover),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                newsItem.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
