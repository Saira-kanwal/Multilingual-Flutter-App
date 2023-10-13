import '../res/app_colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils {

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColors.blackColor,
      textColor: AppColors.whiteColor,
      gravity: ToastGravity.BOTTOM,//position
      toastLength: Toast.LENGTH_LONG
    );
  }
  static snackBar({required BuildContext context, required String message})
  {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }










}