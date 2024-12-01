import 'article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  // Generated JSON serialization methods
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
