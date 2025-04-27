import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_front_end/Features/repository/auth_repository.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';

abstract class AuthController extends GetxController {
  Future<void> signIn({required String email, required String passowrd});
  Future<void> signUp({
    required String email,
    required String passowrd,
    required String userName,
  });
  Future<void> forgotePassowrd({required String email});
  Future<void> verifiyCode({required String email, required String code});
  Future<void> restPassowrd({required String email, required String passowrd});
}

class AuthControllerImpl extends AuthController {
  AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl();

  @override
  Future<void> forgotePassowrd({required String email}) async {
    final request = await _authRepositoryImpl.forgotePassowrd(email: email);

    request.fold(
      (failure) {
        // handle erorr
        handleErorr(failure);
      },
      (_) {
        // handle sauccess
        handleSuccess();
      },
    );
  }

  @override
  Future<void> restPassowrd({
    required String email,
    required String passowrd,
  }) async {
    final request = await _authRepositoryImpl.restPassowrd(
      email: email,
      passowrd: passowrd,
    );
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        handleSuccess();
      },
    );
  }

  @override
  Future<void> signIn({required String email, required String passowrd}) async {
    final request = await _authRepositoryImpl.signIn(
      email: email,
      passowrd: passowrd,
    );
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        handleSuccess();
      },
    );
  }

  @override
  Future<void> signUp({
    required String email,
    required String passowrd,
    required String userName,
  }) async {
    lodingDialog();

    final request = await _authRepositoryImpl.signUp(
      email: email,
      passowrd: passowrd,
      userName: userName,
    );
    Get.back();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        handleSuccess();
      },
    );
  }

  @override
  Future<void> verifiyCode({
    required String email,
    required String code,
  }) async {
    final request = await _authRepositoryImpl.verifiyCode(
      email: email,
      code: code,
    );
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        handleSuccess();
      },
    );
  }
}
