import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class MyDropDownList extends StatefulWidget {
  final List<CategoryOrUnit> data;
  final Function(CategoryOrUnit?) onChanged;
  final String hint;
  final CategoryOrUnit? value;
  const MyDropDownList({
    this.value,
    required this.onChanged,
    required this.hint,
    super.key,
    required this.data,
  });

  @override
  State<MyDropDownList> createState() => _MyDropDownListState();
}

class _MyDropDownListState extends State<MyDropDownList> {
  List<DropdownMenuItem<CategoryOrUnit>> items = [];

  @override
  void initState() {
    super.initState();
    // items =
    //     widget.data
    //         .map<DropdownMenuItem<CategoryOrUnit>>(
    //           (e) => DropdownMenuItem(value: e, child: Text(e.name)),
    //         )
    //         .toList();

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryOrUnit>(
      value: widget.data.isNotEmpty ? widget.value : null,
      decoration: InputDecoration(
        hintStyle: AppStyles.subTitle(),
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.colorScheme.primary),
        ),
      ),
      items: [
        ...widget.data.map<DropdownMenuItem<CategoryOrUnit>>(
          (e) => DropdownMenuItem(value: e, child: Text(e.name)),
        ),
      ],
      onChanged: widget.onChanged,
    );
  }
}

class CategoryOrUnit {
  int id;
  String name;
  CategoryOrUnit({required this.id, required this.name});
}

class MyDropDownListWithLable extends StatelessWidget {
  final List<CategoryOrUnit> data;
  final Function(CategoryOrUnit?) onChanged;
  final String hint;
  final String lable;
  final CategoryOrUnit? value;
  const MyDropDownListWithLable({
    this.value,
    super.key,
    required this.data,
    required this.onChanged,
    required this.hint,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: AppStyles.normalStyleTitle()),
        SizedBox(height: 10),
        MyDropDownList(
          value: value,
          onChanged: onChanged,
          hint: hint,
          data: data,
        ),
      ],
    );
  }
}
