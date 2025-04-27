import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:food_delivery_front_end/core/constant/helper.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/network/network.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String passowrd,
  });
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String passowrd,
    required String userName,
  });
  Future<Either<Failure, Unit>> forgotePassowrd({required String email});
  Future<Either<Failure, Unit>> verifiyCode({
    required String email,
    required String code,
  });
  Future<Either<Failure, Unit>> restPassowrd({
    required String email,
    required String passowrd,
  });
}

class AuthRepositoryImpl extends AuthRepository {
  final GetConnect _getConnect = GetConnect();
  final NetworkInfo _networkInfo = NetworkInfo();

  @override
  Future<Either<Failure, Unit>> forgotePassowrd({required String email}) async {
    if (await _networkInfo.isConnected) {
      final body = {"email": email};

      final response = await _getConnect.post(
        "$rootApi/forgot",
        jsonEncode(body),
        headers: headersList,
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          return const Right(unit);
        } else {
          return Left(InvalidEmailFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> restPassowrd({
    required String email,
    required String passowrd,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"email": email, "password": passowrd};

      final response = await _getConnect.post(
        "$rootApi/reset",
        jsonEncode(body),
        headers: headersList,
      );

      if (response.statusCode == 200) {
        return Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String passowrd,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"email": email, "password": passowrd};

      final response = await _getConnect.post(
        "$rootApi/signIn",
        jsonEncode(body),
        headers: headersList,
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          return const Right(unit);
        } else {
          return Left(InvalidAccountFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String passowrd,
    required String userName,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"name": userName, "email": email, "password": passowrd};

      final response = await _getConnect.post(
        "$rootApi/signUp",
        jsonEncode(body),
        headers: headersList,
      );
      if (response.statusCode == 200) {
        final jsondata = response.body;
        if (jsondata['status'] == true) {
          return const Right(unit);
        } else {
          final jsonData = response.body;

          if (jsonData['errors']["name"] != null) {
            return Left(NameExistsFailure());
          } else if (jsonData['errors']["email"] != null) {
            return Left(EmailExistsFailure());
          } else {
            return Left(OprtingFailure());
          }
        }
      } else if (response.statusCode == 422) {
        final jsonData = response.body;

        if (jsonData['errors']["name"] != null) {
          return Left(NameExistsFailure());
        } else if (jsonData['errors']["email"] != null) {
          return Left(EmailExistsFailure());
        } else {
          return Left(OprtingFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> verifiyCode({
    required String email,
    required String code,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"code": code, "email": email};

      final response = await _getConnect.post(
        "$rootApi/code",
        jsonEncode(body),
        headers: headersList,
      );
      if (response.statusCode == 200) {
        final jsondata = response.body;
        if (jsondata['status'] == true) {
          return const Right(unit);
        } else {
          return Left(InvalidCodeFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
