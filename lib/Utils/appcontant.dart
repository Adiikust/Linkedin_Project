import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstant{
  static int? currentUserID;
  static void flutterToastError({required String responseMessage}) {
    Fluttertoast.showToast(
        msg: responseMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void flutterToastSuccess({required String responseMessage}) {
    Fluttertoast.showToast(
        msg: responseMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: const Color(0xff2A84F2),
        textColor:  Colors.white,
        fontSize: 16.0);
  }
}