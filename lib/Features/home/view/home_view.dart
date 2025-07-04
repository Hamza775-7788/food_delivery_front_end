import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/home/controller/home_controller.dart';
import 'package:food_delivery_front_end/Features/home/viewmodel/home_viewModel.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';

import 'package:food_delivery_front_end/core/constant/image.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';

import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewmodel viewmodel = HomeViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeControllrImpl>(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                child: Image.asset(AppImage.homeImage, fit: BoxFit.cover),
              ),
              SliverToBoxAdapter(child: Text(viewmodel.categoryLable)),
              SliverToBoxAdapter(
                child: CategoryListItem(
                  categories: viewmodel.categories,
                  onTap: (index) {
                    viewmodel.getProudct(index);
                    setState(() {});
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    required this.categories,
    required this.onTap,
    super.key,
  });
  final Function(int index) onTap;
  final List<CategoryModel> categories;

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
            child: Container(
              margin: EdgeInsets.all(5),

              width: 80,
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Image.network("$storage/${category.image}", height: 50),
                  Text(category.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.child});

  // العنوان في الحالة المطوية (العلوي)
  final Widget child; // المحتوى الأساسي

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Food Delvry"),
      centerTitle: true, // يظهر عند التمرير لأعلى
      expandedHeight: 300,
      floating: false,
      pinned: true,
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        // يظهر عند التمرير لأسفل
        background: child,
        centerTitle: true,
      ),
    );
  }
}
