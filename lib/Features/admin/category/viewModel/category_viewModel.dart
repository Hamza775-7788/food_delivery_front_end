import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:food_delivery_front_end/Features/admin/category/controller/category_controller.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CategoryViewModel {
  CategoryControllerImpl _controllerImpl = Get.put(CategoryControllerImpl());
  CategoryViewModel() {
    _controllerImpl.getCategories();
  }
  String title = "Category";
  String addLable = "add";
  String updateLable = "update";
  String deleteLable = "Delete";
  String clearLable = "Clear";
  String nameLable = "name";
  String idLable = "id";
  String pickImageLable = "Pick Image";
  late TextEditingController nameController;
  late TextEditingController idConteroler;

  List<CategoryModel> get categories {
    return _controllerImpl.categories;
  }

  String url = "";
  File? image;
  onPickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? _image = await picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      image = File(_image.path);
    } else {}
  }

  onAdd() async {
    if (nameController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "name is Empty"));
    } else if (image == null) {
      Get.dialog(ErrorDialog(message: "image is required"));
    } else {
      CategoryModel categoryModel = CategoryModel(
        id: 0,
        name: nameController.text,
        image: "",
      );
      _controllerImpl.addCategory(category: categoryModel, image: image!);
    }
  }

  onDelete() {
    if (idConteroler.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "no category select"));
    } else {
      _controllerImpl.deleteCategory(id: int.parse(idConteroler.text));
    }
  }

  onUpdate() {
    if (nameController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "name is Empty"));
    } else if (idConteroler.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "no category select"));
    } else {
      CategoryModel categoryModel = CategoryModel(
        id: int.parse(idConteroler.text),
        name: nameController.text,
        image: url,
      );
      _controllerImpl.updateCategory(category: categoryModel, image: image);
    }
  }

  onSelect(CategoryModel category) {
    idConteroler.text = category.id.toString();
    nameController.text = category.name;
    url = category.image;
  }

  onClear() {
    idConteroler.clear();
    nameController.clear();
  }
}
