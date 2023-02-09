import 'package:ecommerce/api/api_manger.dart';
import 'package:ecommerce/base/base_view_model.dart';
import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/repository/auth/auth_repo_contract.dart';
import 'package:ecommerce/repository/auth/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce/repository/auth/impl/auth_repo_impl.dart';
import 'package:ecommerce/ui/dialog/dialog_uitils.dart';
import 'package:ecommerce/ui/login/login_navigator.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel <LoginNavigator> {

  AppConfigProvider configProvider;
  AuthRepository authRepository;

  LoginViewModel(this.authRepository,this.configProvider);

    //authRepository = AuthRepositoryImpl(remoteDateSource);
  void login(String email, String password) async {
    navigator?.showProgressDialog('Loading...');
    try {
      var token = await authRepository.login(
        email,
        password,
      );
      navigator?.hidDialog();
      if (token == null) {
        navigator?.showMessage( "Unable to Login , Wrong User Name  ",
            posActionTitle: 'OK');
        return ;
      }
      // navigate to home //
      navigator?.showMessage( 'Successful Login',
          posActionTitle: 'OK',posAction: (){
        configProvider.updateToken(token);
        // navigate to home screen //
          navigator?.gotoHome();
          },isDismissible: false,
      );
    } catch (e) {
      navigator?.hidDialog();
      navigator?.showMessage('Error$e');
    }
  }
}
