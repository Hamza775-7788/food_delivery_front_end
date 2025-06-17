import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/viewModel/splash_screen_viewModel.dart';
import 'package:food_delivery_front_end/core/constant/image.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenViewmodel viewmodel = SplashScreenViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(AppImage.onBordingImage, fit: BoxFit.cover),
      ),
    );
  }
}
