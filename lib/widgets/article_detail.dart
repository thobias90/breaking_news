import 'package:flutter/material.dart';
import 'package:breaking_news/model/article.dart'; // Assuming you have the Article model

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null)
                Image.network(
                  article.urlToImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 16),
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (article.description != null)
                Text(
                  article.description!,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              const SizedBox(height: 16),
              if (article.content != null)
                Text(
                  article.content!,
                  style: const TextStyle(fontSize: 16),
                ),
              const SizedBox(height: 16),
              if (article.author != null)
                Text(
                  'Author: ${article.author}',
                  style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
