import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/erorrs/excsptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CASHED_TOKEN = "CASHED_TOKEN";

class LocalDataSource {
  SharedPreferences _sharedPreferences;
  LocalDataSource({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  Future<String> getToken() async {
    final _token = _sharedPreferences.getString(CASHED_TOKEN);

    if (_token == null) {
      throw EmptyCashdDataSourceExceptions();
    } else {
      return _token;
    }
  }

  Future<Unit> cashedToken({required String token}) async {
    await _sharedPreferences.setString(CASHED_TOKEN, token);
    return unit;
  }
}
