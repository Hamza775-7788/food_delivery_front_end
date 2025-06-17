import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/admin/category/controller/category_controller.dart';
import 'package:food_delivery_front_end/Features/admin/product/controller/admin_product_controller.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductViewmodel {
  final Function() onUpdate;
  final ProductModel product;
  String title = " Update Products";

  final AdminProductControllerImpl _controllerImpl = Get.put(
    AdminProductControllerImpl(),
  );

  final CategoryControllerImpl _categoryControllerImpl = Get.put(
    CategoryControllerImpl(),
  );
  UpdateProductViewmodel({required this.onUpdate, required this.product}) {
    getData();
  }

  String url = '';
  setData() {
    nameController.text = product.name;
    descriptionController.text = product.description;
    deliveryPriceController.text = product.deliveryPrice.toString();
    priceController.text = product.price.toString();
    makeTimeController.text = product.makeTime;
    categoryID = product.categoryId;
    categoryText = product.category;
    url = product.image;
    onUpdate();
  }

  getData() async {
    await _categoryControllerImpl.getCategories();
    onUpdate();
  }

  List<CategoryModel> get categories {
    return _categoryControllerImpl.categories;
  }

  String updateLable = "update";
  String pickImage = "Select Image";
  late TextEditingController nameController;
  String nameLable = "Name";
  late TextEditingController descriptionController;
  String descriptionLable = "Description";
  late TextEditingController priceController;
  String priceLable = "Price";
  late TextEditingController deliveryPriceController;
  String deliveryPriceLable = 'Delivery Pric';
  late TextEditingController makeTimeController;
  String makeTimeLable = 'Make Time';

  int? categoryID;
  String categoryLable = 'Category';
  String? categoryText;

  File? image;
  onPickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? _image = await picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      image = File(_image.path);
      onUpdate();
    } else {}
  }

  update() {
    if (nameController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "لا يمكن ان يكون الاسم فارغ"));
    } else if (descriptionController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "لا يمكن ان يكون الوصف فارغ"));
    } else if (priceController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "يجب اضافه سعر "));
    } else if (makeTimeController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "يجب اضافه مدة التوصيل"));
    } else if (deliveryPriceController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "يجب اضافه سعر التوصيل"));
    } else if (categoryID == null) {
      Get.dialog(ErrorDialog(message: "يجب اختيار مجموعه اولاً"));
    } else {
      ProductModel _product = ProductModel(
        id: product.id,
        createdAt: "",
        name: nameController.text,
        image: "image!",
        description: descriptionController.text,
        categoryId: categoryID!,
        price: double.parse(priceController.text),
        deliveryPrice: double.parse(deliveryPriceController.text),
        makeTime: makeTimeController.text,
        averageRating: 0,
        category: categoryText!,
        categoryImage: "",
      );
      _controllerImpl.updateProduct(product: _product, imgae: image);
    }
  }
}
