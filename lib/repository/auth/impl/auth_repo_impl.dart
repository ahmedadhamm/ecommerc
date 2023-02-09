import 'package:ecommerce/repository/auth/auth_repo_contract.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDateSource remoteDateSource;
  AuthRepositoryImpl(this.remoteDateSource);

  @override
  Future<String?> login(String email, String password) async {
   var response= await remoteDateSource.login(email, password);
   return response.token;

  }

  @override
  Future<String?> register(String name, String email,
      String password, String passwordConfirmation, String phone)async {
    var response = await remoteDateSource.register(name, email,
        password, passwordConfirmation, phone);
    return response.token;

  }


}