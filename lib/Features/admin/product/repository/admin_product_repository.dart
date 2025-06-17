import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:food_delivery_front_end/core/constant/helper.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/local_dara_source/local_data_source.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/network/network.dart';
import 'package:food_delivery_front_end/core/upload_packge/upload_File.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

abstract class AdminProductRepository {
  Future<Either<Failure, Unit>> addProduct({
    required ProductModel product,
    required File imgae,
  });
  Future<Either<Failure, Unit>> updateProduct({
    required ProductModel product,
    File? imgae,
  });
  Future<Either<Failure, Unit>> deleteProduct({required int id});
  Future<Either<Failure, List<ProductModel>>> getProduct();
}

class AdminProductRepositoryImpl implements AdminProductRepository {
  final GetConnect getConnect = GetConnect();
  final NetworkInfo networkInfo = NetworkInfo();
  final UploaidFilesImpl _uploaidFilesImpl = UploaidFilesImpl();
  // ignore: unused_field
  final LocalDataSource _localDataSource = LocalDataSource(
    sharedPreferences: sharedPreferences,
  );
  @override
  Future<Either<Failure, Unit>> addProduct({
    required ProductModel product,
    required File imgae,
  }) async {
    if (await networkInfo.isConnected) {
      final body = product.toJson();

      final url = await _uploaidFilesImpl.uploadFile(
        file: imgae,
        foleder: "products",
        url: "$rootApi/file",
      );
      body['image'] = url;
      var headers = headersList;
      final response = await getConnect.post(
        "$rootApi/product",
        jsonEncode(body),
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          return Right(unit);
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
  Future<Either<Failure, Unit>> deleteProduct({required int id}) async {
    if (await networkInfo.isConnected) {
      var headers = headersList;
      final response = await getConnect.delete(
        "$rootApi/product/$id",

        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          return Right(unit);
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
  Future<Either<Failure, List<ProductModel>>> getProduct() async {
    if (await networkInfo.isConnected) {
      var headers = headersList;
      final response = await getConnect.get(
        "$rootApi/product",

        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          final listData = jsonData['data'] as List;

          return Right(
            listData
                .map<ProductModel>((e) => ProductModel.fromJson(e))
                .toList(),
          );
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
  Future<Either<Failure, Unit>> updateProduct({
    required ProductModel product,
    File? imgae,
  }) async {
    if (await networkInfo.isConnected) {
      final body = product.toJson();

      if (imgae != null) {
        final url = await _uploaidFilesImpl.uploadFile(
          file: imgae,
          foleder: "products",
          url: "$rootApi/file",
        );
        body['image'] = url;
      }

      var headers = headersList;
      final response = await getConnect.put(
        "$rootApi/product/${product.id}",
        jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          return Right(unit);
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
}

// CRUD database
