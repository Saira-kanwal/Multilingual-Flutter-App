import 'package:flutter/material.dart';
import '../screens/dashboard/dashboard_screen.dart';

class NewPasswordVM extends ChangeNotifier{


  GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
  bool loading = false;

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible (bool val)
  {
    _passwordVisible = val;
    notifyListeners();
  }

  void confirm(BuildContext context){

    if (newPasswordFormKey.currentState!.validate()){
      loading = true ;
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
      loading = false ;
      newPasswordController.clear();
      confirmPasswordController.clear();
      notifyListeners();
    }
  }

}