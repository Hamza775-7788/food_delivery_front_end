import 'dart:io';

import 'package:food_delivery_front_end/Features/admin/category/repository/category_repository.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';

abstract class CategoryController extends GetxController {
  Future<void> getCategories();
  Future<void> addCategory({
    required CategoryModel category,
    required File image,
  });
  Future<void> updateCategory({required CategoryModel category, File? image});
  Future<void> deleteCategory({required int id});
}

class CategoryControllerImpl extends CategoryController {
  final CategoryRepositoryImpl _repositoryImpl = CategoryRepositoryImpl();

  List<CategoryModel> categories = [];

  @override
  Future<void> addCategory({
    required CategoryModel category,
    required File image,
  }) async {
    try {
      lodingDialog();
      final response = await _repositoryImpl.addCategoy(
        category: category,
        image: image,
      );
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
          getCategories();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> deleteCategory({required int id}) async {
    try {
      lodingDialog();
      final response = await _repositoryImpl.deleteCategoy(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
          getCategories();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> getCategories() async {
    try {
     
      final response = await _repositoryImpl.getCategories();
  
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (data) {
          categories = data;
          update();
        },
      );
    } catch (e) {

      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> updateCategory({
    required CategoryModel category,
    File? image,
  }) async {
    try {
      lodingDialog();
      final response = await _repositoryImpl.updateCategoy(
        category: category,
        image: image,
      );
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
          getCategories();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }
}
