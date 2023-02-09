import 'package:ecommerce/base/base_navigator.dart';
import 'package:ecommerce/base/base_view_model.dart';
import 'package:ecommerce/ui/dialog/dialog_uitils.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget,VM extends BaseViewModel> extends State<T>
    implements BaseNavigator {
 late VM viewModel;
 VM initViewModel();

 @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;

  }
  @override
  void showMessage(String message,
      {String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUitils.showMessage(
      context,
      message,
      posAction: posAction,
      posActionTitle: posActionTitle,
      negAction: negAction,
      negActionTitle: negActionTitle,
      isDismissible: isDismissible,
    );
  }

  @override
  void showProgressDialog(String progressMessage) {
    DialogUitils.showporgrssDialog(context, progressMessage);
  }

  @override
  void hidDialog() {
    DialogUitils.hideDialog(context);
  }
}
