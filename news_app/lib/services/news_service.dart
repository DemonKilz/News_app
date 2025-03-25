import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsService {
  final String apiKey = '5826e0c14147484688f0d41879cb0c17'; // 🔹 Replace with your API key
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  Future<List<NewsArticle>> fetchArticles() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl$apiKey'));


      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Ensure 'articles' key exists in API response
        if (data['articles'] == null) {
          throw Exception("No articles found in response.");
        }

        return (data['articles'] as List)
            .map((json) => NewsArticle.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load news: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load news");
    }
  }
}
