// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:food_delivery_front_end/core/constant/helper.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/local_dara_source/local_data_source.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:food_delivery_front_end/core/network/network.dart';
import 'package:food_delivery_front_end/core/upload_packge/upload_File.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, Unit>> addCategoy({
    required CategoryModel category,
    required File image,
  });
  Future<Either<Failure, Unit>> updateCategoy({
    required CategoryModel category,
    File? image,
  });
  Future<Either<Failure, Unit>> deleteCategoy({required int id});
}

class CategoryRepositoryImpl implements CategoryRepository {
  final GetConnect _getConnect = GetConnect();
  final NetworkInfo _networkInfo = NetworkInfo();
  final UploaidFilesImpl _uploaidFilesImpl = UploaidFilesImpl();
  final LocalDataSource _localDataSource = LocalDataSource(
    sharedPreferences: sharedPreferences,
  );
  @override
  Future<Either<Failure, Unit>> addCategoy({
    required CategoryModel category,
    required File image,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final url = await _uploaidFilesImpl.uploadFile(
          file: image,
          foleder: "categories",
          url: "$rootApi/file",
        );

        category.image = url;
        Map body = category.toJson();
        final response = await _getConnect.post(
          "$rootApi/category",
          jsonEncode(body),
          headers: headersList,
        );
        if (response.statusCode == 200) {
          return const Right(unit);
        } else if (response.statusCode == 422) {
          throw Exception(response.body['message']);
        } else {
          return Left(ServerFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        rethrow;
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCategoy({required int id}) async {
    if (await _networkInfo.isConnected) {
      final response = await _getConnect.delete(
        "$rootApi/category/$id",
        headers: headersList,
      );
      if (response.statusCode == 200) {
        return const Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    if (await _networkInfo.isConnected) {
      final response = await _getConnect.get("$rootApi/category");
      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          final listData = jsonData['data'] as List;
          List<CategoryModel> categories = [];
          categories =
              listData
                  .map<CategoryModel>((e) => CategoryModel.fromjson(e))
                  .toList();
          return Right(categories);
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
  Future<Either<Failure, Unit>> updateCategoy({
    required CategoryModel category,
    File? image,
  }) async {
    try {
      if (await _networkInfo.isConnected) {
        if (image != null) {
          final url = await _uploaidFilesImpl.uploadFile(
            file: image,
            foleder: "categories",
            url: "$rootApi/file",
          );

          category.image = url;
        }
        Map body = category.toJson();
        final response = await _getConnect.put(
          "$rootApi/category/${category.id}",
          jsonEncode(body),
          headers: headersList,
        );
        if (response.statusCode == 200) {
          return const Right(unit);
        } else if (response.statusCode == 422) {
          throw Exception(response.body['message']);
        } else {
          return Left(ServerFailure());
        }
      } else {
        return Left(OfflineFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      rethrow;
    }
  }
}
