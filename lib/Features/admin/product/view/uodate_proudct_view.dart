import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/admin/product/viewModel/update_product_view_model.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/shared/My_drop_Down_List.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/shared/text_field_widget.dart';

class UpdateProductViewPage extends StatefulWidget {
  final ProductModel product;
  const UpdateProductViewPage({required this.product, super.key});

  @override
  State<UpdateProductViewPage> createState() => _UpdateProductViewPageState();
}

class _UpdateProductViewPageState extends State<UpdateProductViewPage> {
  late UpdateProductViewmodel viewModel;
  @override
  void initState() {
    viewModel = UpdateProductViewmodel(
      product: widget.product,
      onUpdate: () {
        setState(() {});
      },
    );
    viewModel.nameController = TextEditingController();
    viewModel.deliveryPriceController = TextEditingController();
    viewModel.descriptionController = TextEditingController();
    viewModel.makeTimeController = TextEditingController();
    viewModel.priceController = TextEditingController();
    viewModel.setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.categories;
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.nameController,
                hint: "",
                lable: viewModel.nameLable,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 16)),
            if (viewModel.categories.isEmpty)
              SliverToBoxAdapter(
                child: MyDropDownListWithLable(
                  lable: viewModel.categoryLable,
                  onChanged: (value) {
                    if (value != null) {
                      viewModel.categoryID = value.id;
                      viewModel.categoryText = value.name;
                    }
                  },
                  hint: '',
                  data: [
                    ...viewModel.categories.map<CategoryOrUnit>(
                      (e) => CategoryOrUnit(id: e.id, name: e.name),
                    ),
                  ],
                ),
              ),
            if (viewModel.categories.isNotEmpty)
              SliverToBoxAdapter(
                child: MyDropDownListWithLable(
                  lable: viewModel.categoryLable,
                  onChanged: (value) {
                    if (value != null) {
                      viewModel.categoryID = value.id;
                      viewModel.categoryText = value.name;
                    }
                  },
                  hint: viewModel.categoryText ?? "",
                  data:
                      viewModel.categories
                          .map<CategoryOrUnit>(
                            (e) => CategoryOrUnit(id: e.id, name: e.name),
                          )
                          .toList(),
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                maxLine: 5,
                controller: viewModel.descriptionController,
                hint: "",
                lable: viewModel.descriptionLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.priceController,
                hint: "",
                lable: viewModel.priceLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.deliveryPriceController,
                hint: "",
                lable: viewModel.deliveryPriceLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.makeTimeController,
                hint: "",
                lable: viewModel.makeTimeLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyGenralButton(
                backgroundColor:
                    viewModel.image == null ? Colors.red : Colors.green,
                onPressed: () {
                  viewModel.onPickImage();
                },
                name: viewModel.pickImage,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyGenralButton(
                onPressed: () {
                  viewModel.update();
                },
                name: viewModel.updateLable,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
