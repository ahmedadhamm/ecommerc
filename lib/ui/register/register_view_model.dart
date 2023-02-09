import 'package:ecommerce/api/api_manger.dart';
import 'package:ecommerce/base/base_view_model.dart';
import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/repository/auth/auth_repo_contract.dart';
import 'package:ecommerce/repository/auth/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce/repository/auth/impl/auth_repo_impl.dart';
import 'package:ecommerce/ui/dialog/dialog_uitils.dart';
import 'package:ecommerce/ui/home/home_Screen.dart';
import 'package:ecommerce/ui/register/register_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  AppConfigProvider configProvider;

   AuthRepository authRepository;

  RegisterViewModel(this.authRepository,this.configProvider);


  void register(String name, String email, String password,
      String passwordConfirmation, String phone) async {
    navigator?.showMessage('Loading...');
    try {
      var token = await authRepository.register(
          name, email, password, passwordConfirmation, phone);
      navigator?.hidDialog();
      if (token == null) {
        navigator?.showMessage('Unable To Register', posActionTitle: 'OK');
        return;
      }
      // navigate to home //
      navigator?.showMessage('Successful Registration', posActionTitle: 'OK',
          posAction: () {
        configProvider.updateToken(token);
        // navigate to home //
        navigator?.gotoHome();
      }, isDismissible: false);
    } catch (e) {
      navigator?.hidDialog();
      navigator?.showMessage('Error$e');
    }
  }
}
