import 'package:food_delivery_front_end/Features/admin/product/controller/admin_product_controller.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:get/get.dart';

class AdminProductViewModel {
  String title = "Product";

  AdminProductViewModel() {
    _controllerImpl.getProduct();
  }
  AdminProductControllerImpl _controllerImpl = Get.put(
    AdminProductControllerImpl(),
  );

  List<ProductModel> get products {
    return _controllerImpl.products;
  }
}
