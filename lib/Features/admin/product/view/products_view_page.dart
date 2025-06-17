import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/admin/product/controller/admin_product_controller.dart';
import 'package:food_delivery_front_end/Features/admin/product/view/add_product_view_page.dart';
import 'package:food_delivery_front_end/Features/admin/product/view/uodate_proudct_view.dart';
import 'package:food_delivery_front_end/Features/admin/product/viewModel/product_view_viewModel.dart';
import 'package:get/get.dart';

class AdminProductViewPage extends StatefulWidget {
  const AdminProductViewPage({super.key});

  @override
  State<AdminProductViewPage> createState() => _AdminProductViewPageState();
}

class _AdminProductViewPageState extends State<AdminProductViewPage> {
  AdminProductViewModel viewModel = AdminProductViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<AdminProductControllerImpl>(
        builder: (c) {
          return ListView.builder(
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final product = viewModel.products[index];
              return ListTile(
                onTap: () {
                  Get.to(() => UpdateProductViewPage(product: product));
                },
                title: Text(product.name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddProductViewPage());
        },
      ),
    );
  }
}
