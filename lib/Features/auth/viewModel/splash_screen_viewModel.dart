import 'package:food_delivery_front_end/Features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SplashScreenViewmodel {
  AuthControllerImpl _controllerImpl = Get.put(AuthControllerImpl());

  SplashScreenViewmodel() {
    _controllerImpl.splashScreen();
  }
}
