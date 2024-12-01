import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/categories.dart';
import '../controller/storage_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  final StorageController storageController = Get.put(StorageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Select Category'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, storageController.getFavoriteCategory());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Favorite Category:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Obx(() {
              final favoriteCategory = storageController.favoriteCategory.value;
              if (favoriteCategory != null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Chip(
                    label: Text(favoriteCategory),
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                    deleteIcon: Icon(Icons.clear, color: Theme.of(context).colorScheme.onPrimaryContainer),
                    onDeleted: () {
                      storageController.setFavoriteCategory(null);
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      storageController.setFavoriteCategory(category);
                    },
                    child: Obx(() {
                      final favoriteCategory = storageController.favoriteCategory.value;
                      return Container(
                        decoration: BoxDecoration(
                          color: favoriteCategory == category
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).colorScheme.surface, // Softer background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: favoriteCategory == category
                                ? Theme.of(context).colorScheme.onPrimaryContainer // Contrasting text
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
