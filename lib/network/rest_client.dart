import 'package:dio/dio.dart';
import 'package:breaking_news/model/news_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

const String apiKey = '';
const url = 'https://newsapi.org/v2';

@RestApi(baseUrl: url)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
  @GET('/top-headlines?country={country}&apiKey=$apiKey')
  Future<NewsResponse> getNewsResponse(@Path() String country);

  @GET('/top-headlines?country={country}&category={category}&apiKey=$apiKey')
  Future<NewsResponse> getNewsByCategory(
      @Path() String country, @Path() String category);
}
