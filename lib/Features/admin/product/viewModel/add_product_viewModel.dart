import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/admin/category/controller/category_controller.dart';
import 'package:food_delivery_front_end/Features/admin/product/controller/admin_product_controller.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:get/get.dart';

class AddProductViewmodel {
  String title = " Add Products";

  AdminProductControllerImpl _controllerImpl = Get.put(
    AdminProductControllerImpl(),
  );

  CategoryControllerImpl _categoryControllerImpl = Get.put(
    CategoryControllerImpl(),
  );

 List<CategoryModel>  get categories {
    return _categoryControllerImpl.categories;
  }

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


  onAdd(){
    
  }
}
