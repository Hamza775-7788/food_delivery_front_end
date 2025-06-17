import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/admin/views/viewModel/admin_view_model.dart';

class AdminViewPage extends StatefulWidget {
  const AdminViewPage({super.key});

  @override
  State<AdminViewPage> createState() => _AdminViewPageState();
}

class _AdminViewPageState extends State<AdminViewPage> {
  AdminViewModel viewModel = AdminViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: ListView(
        children: [
          ListTile(
            onTap: viewModel.onCategories,
            title: Text(viewModel.categoryLable),
            leading: Icon(Icons.category),
          ),
          ListTile(
            onTap: viewModel.onOrders,
            title: Text(viewModel.orders),
            leading: Icon(Icons.money_off_csred_sharp),
          ),
          ListTile(
            onTap: viewModel.onProducts,
            title: Text(viewModel.productsLable),
            leading: Icon(Icons.insert_emoticon),
          ),
        ],
      ),
    );
  }
}
