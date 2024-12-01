import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/news_response.dart';
import '../network/rest_client.dart';

class NewsController extends GetxController {
  final RestClient _restClient = RestClient(Dio());
  var newsResponse = Rx<NewsResponse?>(null);
  var isLoading = false.obs;
  var error = ''.obs;

  void fetchNewsByCountry(String country) async {
    try {
      isLoading.value = true;
      error.value = '';
      newsResponse.value = await _restClient.getNewsResponse(country);
    } catch (e) {
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void fetchNewsByCategory(String category, String country) async {
    try {
      isLoading.value = true;
      error.value = '';
      newsResponse.value =
          await _restClient.getNewsByCategory(country, category);
    } catch (e) {
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
