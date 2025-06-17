import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/admin/views/view/admin_view_page.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AdminViewPage());
            },
            icon: Icon(
              Icons.admin_panel_settings,
              color: Get.theme.colorScheme.primary,
            ),
          ),
        ],
        title: Text("Home View"),
      ),
    );
  }
}
