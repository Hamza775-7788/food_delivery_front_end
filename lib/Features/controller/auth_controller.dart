import 'dart:convert';

import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:get/get.dart';

abstract class AuthController extends GetxController {
  Future<void> signIn({required String email, required String passowrd});
  Future<void> signUp({
    required String email,
    required String passowrd,
    required String userName,
  });
  Future<void> forgotePassowrd({required String email});
  Future<void> verifiyCode({required String email, required String passowrd});
  Future<void> restPassowrd({required String email, required String passowrd});
}

class AuthControllerImpl extends AuthController {
  final GetConnect _getConnect = GetConnect();
  
  @override
  Future<void> forgotePassowrd({required String email}) async {
    // TODO: implement forgotePassowrd
    throw UnimplementedError();
  }

  @override
  Future<void> restPassowrd({
    required String email,
    required String passowrd,
  }) async {
    // TODO: implement restPassowrd
    throw UnimplementedError();
  }

  @override
  Future<void> signIn({required String email, required String passowrd}) async {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({
    required String email,
    required String passowrd,
    required String userName,
  }) async {
    final body = {"name": userName, "email": email, "password": passowrd};
    var headersList = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    print("$rootApi/signUp");
    final response = await _getConnect.post(
      "$rootApi/signUp",
      jsonEncode(body),
      headers: headersList,
    );

    if (response.statusCode == 200) {
      final jsondata = response.body;
      if (jsondata['status']) {
        print(jsondata['user']);
        print(jsondata['token']);
      }
    } else {
      Get.snackbar("خطاء", "خطاء في الاتصال بالسرفر");
    }
  }

  @override
  Future<void> verifiyCode({
    required String email,
    required String passowrd,
  }) async {
    // TODO: implement verifiyCode
    throw UnimplementedError();
  }
}
