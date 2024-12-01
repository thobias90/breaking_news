import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/news_controller.dart';
import '../config/routes.dart';
import '../controller/storage_controller.dart';
import '../widgets/news_card.dart';

class NewsListScreen extends StatefulWidget {
  final String country;
  const NewsListScreen({super.key, required this.country});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  String? _category;

  final NewsController _controller = Get.put(NewsController());
  final StorageController _storageController = Get.put(StorageController());

  @override
  Widget build(BuildContext context) {
    _category = _storageController.favoriteCategory.value;
    _controller.fetchNewsByCategory(_category!, widget.country);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Headlines'),
        actions: [
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () async {
              // Navigate to the category screen and wait for the selected category
              final selectedCategory =
                  await Navigator.pushNamed(context, categoryRoute);
              if (selectedCategory != null) {
                // If category is selected, update news
                _controller.fetchNewsByCategory(
                    selectedCategory.toString().toLowerCase(), widget.country);
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_controller.error.isNotEmpty) {
          return Center(child: Text(_controller.error.value));
        }

        final articles = _controller.newsResponse.value?.articles ?? [];
        if (articles.isEmpty) {
          return const Center(child: Text('No articles found.'));
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return NewsCard(
              article: article,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  articleRoute,
                  arguments: article,
                );
              },
            );
          },
        );
      }),
    );
  }
}
