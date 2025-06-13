import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

          child: GridView(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 7 / 8,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: Categories_data.map((categoryData) => CategoryItem(
                  title: categoryData.title,
                  imageUrl: categoryData.imageUrl,
                  id: categoryData.id,
                )).toList(),
          ),
        );
  }
}
