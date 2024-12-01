import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final GetStorage _storage = GetStorage();
  final RxnString favoriteCategory = RxnString();

  static const String _favoriteCategoryKey = 'favoriteCategory';

  @override
  void onInit() {
    super.onInit();
    // Load the favorite category from storage on initialization
    favoriteCategory.value = _storage.read<String>(_favoriteCategoryKey) ?? "General";
  }

  void setFavoriteCategory(String? category) {
    favoriteCategory.value = category;
    if (category != null) {
      _storage.write(_favoriteCategoryKey, category); // Persist category
    } else {
      _storage.remove(_favoriteCategoryKey); // Remove if null
    }
  }

  String? getFavoriteCategory() {
    return favoriteCategory.value;
  }
}
