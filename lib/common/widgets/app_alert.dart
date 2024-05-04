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
}
