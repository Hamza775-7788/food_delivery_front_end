import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/viewModel/signUp_view_model.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/shared/text_field_widget.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';

class SignUpViewPage extends StatefulWidget {
  const SignUpViewPage({super.key});

  @override
  State<SignUpViewPage> createState() => _SignUpViewPageState();
}

class _SignUpViewPageState extends State<SignUpViewPage> {
  SignupViewModel viewModel = SignupViewModel();

  @override
  void initState() {
    viewModel.emailController = TextEditingController();
    viewModel.passwordController = TextEditingController();
    viewModel.userNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Text(viewModel.title, style: AppStyles.bigTitle()),
              ),
              SliverToBoxAdapter(
                child: Text(viewModel.subTitle, style: AppStyles.subTitle()),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: MyTextFieldWithLable(
                  controller: viewModel.userNameController,
                  hint: viewModel.userNameHint,
                  lable: viewModel.userNameLable,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: MyTextFieldWithLable(
                  controller: viewModel.emailController,
                  hint: viewModel.emailHint,
                  lable: viewModel.emailLable,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: MyTextFieldWithLable(
                  isPassowrd: true,
                  controller: viewModel.passwordController,
                  hint: viewModel.passwordHint,
                  lable: viewModel.passwordLable,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Checkbox(
                      value: viewModel.iAgree,
                      onChanged: (value) {
                        setState(() {
                          viewModel.iAgree = value!;
                        });
                      },
                    ),
                    Text(
                      viewModel.iAgreeLable,
                      style: AppStyles.normalStyleTitle(),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: MyGenralButton(
                  name: viewModel.regestrButtonLable,
                  onPressed: () {
                    viewModel.onSignUp();
                  },
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.readyToSignInLable,
                      style: AppStyles.normalStyleTitle(),
                    ),
                    TextButton(
                      onPressed: () {
                        viewModel.onSignIn();
                      },
                      child: Text(
                        viewModel.signInLable,
                        style: AppStyles.normalStyleTitle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
