import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart'
    show storage;
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:get/get.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    required this.categories,
    required this.onTap,
    required this.selectedIndex,
    super.key,
  });
  final Function(int index) onTap;
  final List<CategoryModel> categories;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              onTap(category.id);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              width: 80,
              decoration: BoxDecoration(
                color:
                    selectedIndex == category.id
                        ? Get.theme.colorScheme.primary
                        : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network("$storage/${category.image}", height: 50),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child:
                          selectedIndex == category.id
                              ? Text(
                                category.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                              : null,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
