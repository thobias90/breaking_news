import 'package:breaking_news/config/routes.dart';
import 'package:breaking_news/widgets/article_detail.dart';
import 'package:breaking_news/widgets/category.dart';
import 'package:breaking_news/widgets/news_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'model/article.dart';

Future<void> main() async {
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breaking News',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: newsRoute,
      routes: {
        newsRoute: (context) => const NewsListScreen(country: 'us'),
        categoryRoute: (context) => const CategoryScreen(),
        articleRoute: (context) => ArticleDetailPage(
              article: ModalRoute.of(context)!.settings.arguments as Article,
            ),
      },
    );
  }
}