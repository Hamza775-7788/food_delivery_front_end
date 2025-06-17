import 'package:food_delivery_front_end/Features/admin/category/view/categoryView.dart';
import 'package:food_delivery_front_end/Features/admin/product/view/products_view_page.dart';
import 'package:get/get.dart';

class AdminViewModel {
  String title = "admin";

  String categoryLable = "Categories";
  String productsLable = "Products";
  String orders = "Orders";
  String users = "Users";

  onCategories() {
    Get.to(() => AdminCategoryViewPage());
  }

  onProducts() {
    Get.to(() => AdminProductViewPage());
  }

  onOrders() {}

  onUsers() {}
}
