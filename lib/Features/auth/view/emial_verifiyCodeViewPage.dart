import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/viewModel/email_verfication_code_viewModel.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:pinput/pinput.dart';

class EmialVerifiycodeviewpage extends StatefulWidget {
  final String email;
  const EmialVerifiycodeviewpage({required this.email, super.key});

  @override
  State<EmialVerifiycodeviewpage> createState() =>
      _EmialVerifiycodeviewpageState();
}

class _EmialVerifiycodeviewpageState extends State<EmialVerifiycodeviewpage> {
  late EmailVerficationCodeViewmodel viewModel;
  @override
  void initState() {
    viewModel = EmailVerficationCodeViewmodel(email: widget.email);
    viewModel.codeController = TextEditingController();

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
              child: Pinput(length: 6, controller: viewModel.codeController),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    viewModel.dontresvCodeLable,
                    style: AppStyles.subTitle(),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      viewModel.onResend();
                    },
                    child: Text(
                      viewModel.resendCodeLable,
                      style: AppStyles.normalStyleTitle(),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
            SliverToBoxAdapter(
              child: MyGenralButton(
                onPressed: () {
                  viewModel.onVerify();
                },
                name: viewModel.verifyButtonLable,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
