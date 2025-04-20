import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/viewModel/forgot_passsored_viewModel.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/shared/text_field_widget.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';

class ForgotePassowrdViewPage extends StatefulWidget {
  const ForgotePassowrdViewPage({super.key});

  @override
  State<ForgotePassowrdViewPage> createState() =>
      _ForgotePassowrdViewPageState();
}

class _ForgotePassowrdViewPageState extends State<ForgotePassowrdViewPage> {
  ForgotPasssoredViewmodel viewModel = ForgotPasssoredViewmodel();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Text(viewModel.title, style: AppStyles.bigTitle()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(viewModel.subTitle, style: AppStyles.subTitle()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.emailController,
                hint: viewModel.emailHint,
                lable: viewModel.emailLable,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
            SliverToBoxAdapter(
              child: MyGenralButton(
                name: viewModel.forgotButtonLable,
                onPressed: () {
                  viewModel.onForgot();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
