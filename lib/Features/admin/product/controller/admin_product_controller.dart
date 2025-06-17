import 'dart:io';

import 'package:food_delivery_front_end/Features/admin/product/repository/admin_product_repository.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';

abstract class AdminProductController extends GetxController {
  Future<void> addproduct({required ProductModel product, required File imgae});
  Future<void> updateProduct({required ProductModel product, File? imgae});
  Future<void> deleteProduct({required int id});
  Future<void> getProduct();
}

class AdminProductControllerImpl extends AdminProductController {
  final AdminProductRepositoryImpl _repository = AdminProductRepositoryImpl();

  List<ProductModel> products = [];
  @override
  Future<void> addproduct({
    required ProductModel product,
    required File imgae,
  }) async {
    try {
      lodingDialog();
      final response = await _repository.addProduct(
        product: product,
        imgae: imgae,
      );
      Get.back();

      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "e"));
    }
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    try {
      lodingDialog();
      final response = await _repository.deleteProduct(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "e"));
    }
  }

  @override
  Future<void> getProduct() async {
    try {
      final response = await _repository.getProduct();

      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (remoteProducts) {
          products = remoteProducts;
          update();
        },
      );
    } catch (e) {
      Get.dialog(ErrorDialog(message: "e"));
    }
  }

  @override
  Future<void> updateProduct({
    required ProductModel product,
    File? imgae,
  }) async {
    try {
      lodingDialog();
      final response = await _repository.updateProduct(
        product: product,
        imgae: imgae,
      );
      Get.back();

      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "e"));
    }
  }
}
