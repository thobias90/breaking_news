# Breaking News App

Breaking News is a Flutter application developed as part of a post-graduation course on mobile development. The app displays daily news headlines and allows users to select and persist their favorite news category. The data is stored using GetX for state management and storage. It leverages the News API to fetch news articles using the Retrofit library.


## Features
- **News List**: Displays top headlines based on the selected country.
- **Categories**: Provides a list of categories (e.g., Business, Entertainment, Health, etc.) for users to explore.
- **Favorite** Category: Users can select a favorite category that persists across app sessions.
- **Light/Dark Mode Support**: Adapts to the system theme dynamically.
- **State Management**: Implements GetX for managing state and persistent storage.


## Technologies Used
- **Flutter**: Framework for building cross-platform applications.
- **GetX**: Used for state management and storage.
- **Retrofit**: Simplifies API calls and integrates with Dio.
- **News API**: Source for fetching news articles.

## Project Structure
Key Components
1. **Config**
    - categories.dart: Contains a list of predefined news categories.
    - routes.dart: Contains the predefined routes of the app.
2. **Controller**
    - storage_controller.dart: Handles persistent storage of the favorite category using GetX's Rx reactive state.
    - news_controller.dart: Handles retrofit rest client.
3.  **Model**
    - article.dart: Define the article model serialization
    - news_response.dart: Define the news response serialization
    - source.dart: Define the source model serialization
4. **Network**
    - rest_client.dart: Handles API requests using Retrofit.
5. **Widgets**
    - article_detail.dart: Widget that display the article full information.
    - category.dart: Widget that display the list of categories.
    - news_card.dart: Widget that display the article card.
    - news_list_screen: Widget that shows the news card into a list view.

## Highlighted Code Features
- **Rest Integration**:
  The rest_client provides a way to retrieve information from the cloud through HTTP protocol.

- **Persistent Storage**:
  The StorageController saves the favorite category in memory using GetX and ensures it persists between app sessions.

- **Dynamic Theming**:
  Uses Flutter's theme management to dynamically adapt UI colors to the system's light or dark mode.

- **Reactive UI**:
  Widgets update automatically using GetX's reactive programming, ensuring seamless updates to the UI when the state changes.

## Getting Started
1. Clone this repository:
```bash
git clone https://github.com/your-username/breaking_news.git
````

2. Install dependencies:
```bash
flutter pub get
````

3. Run the app:
```
flutter run
````

4. Obtain a News API key from News API and add it to your rest_client.dart file.

## Resources for Beginners
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/)

##

This README reflects the use of GetX for state management, Retrofit for API requests, and the app's core features. Let me know if you'd like to add more details!