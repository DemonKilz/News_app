# news_app

****News App****

A Flutter-based news application that fetches and displays news articles dynamically.

**Features**

Fetches latest news from an API.
Displays news articles with headlines, descriptions, and images.
Supports dark mode.
State management using Provider.
Organized project structure following best practices.

**Project Structure**

lib/
│── models/
│   ├── news_article.dart
│── providers/
│   ├── news_provider.dart
│── screens/
│   ├── news_list_screen.dart
│   ├── news_detail_screen.dart
│── services/
│   ├── news_service.dart
│── main.dart


**Technologies Used**

Flutter (Dart) - Frontend framework
Provider - State management
REST API - Fetching news
HTTP Package - API requests

**API Integration & State Management**

Uses Provider for state management.
Fetches news articles using news_service.dart.
Displays articles in news_list_screen.dart and news_detail_screen.dart.


![image](https://github.com/user-attachments/assets/439e656d-c236-4d6b-93cb-e43f8bf515af)
![image](https://github.com/user-attachments/assets/b758dddc-a334-4ea0-970f-20c71ff1bb5b)
![image](https://github.com/user-attachments/assets/bb0c1df7-1c28-4ec5-af1d-59197a6f6009)




**Error Handling & Edge Cases**

Displays a placeholder image if a news image is missing.
Handles network failures with retry mechanisms.
Validates API responses to prevent crashes.

**Future Improvements**

Implement search functionality.
Add category-based news filtering.
Improve UI with animations.






A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
