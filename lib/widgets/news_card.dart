import 'package:flutter/material.dart';

import '../model/article.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap; // Add an onTap callback

  const NewsCard({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the passed onTap callback
      child: Card(
        margin: const EdgeInsets.all(8.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (article.description != null)
                    Text(
                      article.description!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    'Source: ${article.source?.name ?? 'Unknown'}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Published At: ${article.publishedAt}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

