import 'package:breaking_news/model/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()

class Article {
  final Source? source; // Source can be nullable.
  final String? author; // Author can be nullable.
  final String title; // Title should be non-nullable (always required).
  final String? description; // Description can be nullable.
  final String url; // URL should be non-nullable (always required).
  final String? urlToImage; // Image URL can be nullable.
  final String publishedAt; // PublishedAt should be non-nullable (required).
  final String? content; // Content can be nullable.

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}