import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/model/categoryModel.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/network/network.dart';
import 'package:get/get.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductModel>>> getProduct({
    required int categoryID,
  });
  Future<Either<Failure, List<CategoryModel>>> getCategory();

  Future<Either<Failure, List<ProductModel>>> searchProduct({
    required String keyword,
  });
}

class HomeRepositoryImpl implements HomeRepository {
  final GetConnect _getConnect = GetConnect();
  final NetworkInfo _networkInfo = NetworkInfo();
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategory() async {
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
  Future<Either<Failure, List<ProductModel>>> getProduct({
    required int categoryID,
  }) async {
    if (await _networkInfo.isConnected) {
      final response = await _getConnect.get(
        "$rootApi/category/$categoryID/product",
      );
      if (response.statusCode == 200) {
        final jsonData = response.body;

        final listData = jsonData['data'] as List;
        List<ProductModel> categories = [];
        categories =
            listData
                .map<ProductModel>((e) => ProductModel.fromJson(e))
                .toList();
        return Right(categories);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchProduct({
    required String keyword,
  }) async {
    // TODO: implement searchProduct
    throw UnimplementedError();
  }
}
