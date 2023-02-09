
import 'package:ecommerce/api/api_manger.dart';
import 'package:ecommerce/api/model/response/LoginResponse.dart';
import 'package:ecommerce/api/model/response/RegisterResponse.dart';
import 'package:ecommerce/repository/auth/auth_repo_contract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDateSource{

  ApiManger apiManger;
  AuthRemoteDataSourceImpl(this.apiManger);
  @override
  Future<LoginResponse> login(String email, String password) async  {
   var response = await apiManger.login(email, password);
   return response;

  }

  @override
  Future<RegisterResponse> register(String name, String email,
      String password, String passwordConfirmation, String phone) async {
    var response = await apiManger.register(name, email, password,
        passwordConfirmation, phone);
    return response;


  }

}

