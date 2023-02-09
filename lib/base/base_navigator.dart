import 'dart:ui';

abstract class BaseNavigator{
  void hidDialog();
  void showMessage(String message,
      {String? posActionTitle,
        String? negActionTitle,
        VoidCallback? posAction,
        VoidCallback? negAction,
        bool isDismissible = true});
  void showProgressDialog(String progressMessage );
}