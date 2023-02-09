import 'package:ecommerce/api/model/response/LoginResponse.dart';
import 'package:ecommerce/api/model/response/RegisterResponse.dart';

abstract class AuthRepository {
  /// this function returns token in case of successful...
  /// and returns null in case of failed login...
  Future<String?> login(String email, String password);
  Future<String?> register(String name, String email, String password,
      String passwordConfirmation, String phone);
}

abstract class AuthRemoteDateSource {
  /// to call the api...
  Future<LoginResponse> login(String email, String password);
  Future<RegisterResponse> register(String name, String email, String password,
      String passwordConfirmation, String phone);
}
