import 'package:flutter/material.dart';

class DialogUitils {
  static void showporgrssDialog(BuildContext context, String message,
      {bool isDismissbile = true}) {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 12,
              ),
              Text(message),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static void showMessage(BuildContext context, String message,
      {String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Widget> actions = [];
        if (posActionTitle != null) {
          actions.add(TextButton(
              onPressed: () {
                Navigator.pop(context);
                posAction!();
              },
              child: Text(posActionTitle)));
        }
        if (negActionTitle != null) {
          actions.add(TextButton(
              onPressed: () {
                Navigator.pop(context);
                negAction!();
              },
              child: Text(negActionTitle)));
        }
        return AlertDialog(
          content: Text(message),
          actions: actions,
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
