import 'package:food_delivery_front_end/Features/home/repo/home_repository.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  Future<void> getProducts({required int categoryID});
  Future<void> getCategories();
  Future<void> searchProduct({required String kyword});
}

class HomeControllrImpl extends HomeController {
  final HomeRepository _repository = HomeRepositoryImpl();

  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<ProductModel> searchProducts = [];

  @override
  Future<void> getCategories() async {
    final response = await _repository.getCategory();
    response.fold(
      (failure) {
        handleErorr(failure);
      },
      (data) {
        categories = data;
        update();
      },
    );
  }

  @override
  Future<void> getProducts({required int categoryID}) async {
    final response = await _repository.getProduct(categoryID: categoryID);
    response.fold(
      (failure) {
        handleErorr(failure);
      },
      (data) {
        products = data;
        update();
      },
    );
  }

  @override
  Future<void> searchProduct({required String kyword}) async {
    final response = await _repository.searchProduct(keyword: kyword);
    response.fold(
      (failure) {
        handleErorr(failure);
      },
      (data) {
        searchProducts = data;
        update();
      },
    );
  }
}
