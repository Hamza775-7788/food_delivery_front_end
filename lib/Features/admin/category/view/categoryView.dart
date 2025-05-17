import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/admin/category/controller/category_controller.dart';
import 'package:food_delivery_front_end/Features/admin/category/viewModel/category_viewModel.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/shared/text_field_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdminCategoryViewPage extends StatefulWidget {
  const AdminCategoryViewPage({super.key});

  @override
  State<AdminCategoryViewPage> createState() => _AdminCategoryViewPageState();
}

class _AdminCategoryViewPageState extends State<AdminCategoryViewPage> {
  CategoryViewModel viewMode = CategoryViewModel();
  @override
  void initState() {
    viewMode.idConteroler = TextEditingController();
    viewMode.nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewMode.title)),
      body: GetBuilder<CategoryControllerImpl>(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                // container add
                SliverToBoxAdapter(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: MyTextFieldWithLable(
                                controller: viewMode.idConteroler,
                                hint: "",
                                lable: viewMode.idLable,
                              ),
                            ),
                            viewMode.image == null
                                ? MyGenralButton(
                                  onPressed: () {
                                    viewMode.onPickImage();
                                    setState(() {});
                                  },
                                  name: viewMode.pickImageLable,
                                )
                                : Container(
                                  width: 200,
                                  height: 100,
                                  child: Image.file(viewMode.image!),
                                ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        MyTextFieldWithLable(
                          controller: viewMode.nameController,
                          hint: "",
                          lable: viewMode.nameLable,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: MyGenralButton(
                                onPressed: () {
                                  viewMode.onAdd();
                                },
                                name: viewMode.addLable,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: MyGenralButton(
                                onPressed: () {
                                  viewMode.onUpdate();
                                },
                                name: viewMode.updateLable,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: MyGenralButton(
                                onPressed: () {
                                  viewMode.onDelete();
                                },
                                name: viewMode.deleteLable,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: MyGenralButton(
                                onPressed: () {
                                  viewMode.onClear();
                                },
                                name: viewMode.clearLable,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // category List
                SliverList.builder(
                  itemCount: viewMode.categories.length,
                  itemBuilder: (context, index) {
                    final category = viewMode.categories[index];
                    return ListTile(
                      onTap: () {
                        viewMode.onSelect(category);
                      },
                      title: Text(category.name),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
