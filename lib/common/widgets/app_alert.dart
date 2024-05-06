import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppAlert {
  static showToast(String msg) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
    );
  }

  static void showSnackbarCupertino(BuildContext context, String title,
      String subTitle, String textButton, void Function() onPressed) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(subTitle),
          actions: [
            CupertinoDialogAction(
              onPressed: onPressed,
              child: Text(textButton),
            ),
          ],
        );
      },
    );
  }
}
