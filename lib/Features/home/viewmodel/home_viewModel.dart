import 'package:food_delivery_front_end/Features/home/controller/home_controller.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:get/get.dart';

class HomeViewmodel {
  HomeControllrImpl _controllrImpl = Get.put(HomeControllrImpl());
  HomeViewmodel() {
    getData();
  }
  getData() async {
    await _controllrImpl.getCategories();
    selectCategory = _controllrImpl.categories.first.id;
    await _controllrImpl.getProducts(categoryID: selectCategory);
  }

  getProudct(int index) async {
    selectCategory = index;
    await _controllrImpl.getProducts(categoryID: selectCategory);
  }

  int selectCategory = 0;
  List<CategoryModel> get categories => _controllrImpl.categories;
  List<ProductModel> get products => _controllrImpl.products;

  String title = "Food Delevry";
  String subtitle = "Provide the best food for you";

  String categoryLable = "Find by Category";
}
