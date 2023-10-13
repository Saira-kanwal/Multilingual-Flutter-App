import 'package:flutter/material.dart';
import '../screens/password/otp_screen.dart';

class ForgetPasswordVM extends ChangeNotifier{


  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  bool loading = false;

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible (bool val)
  {
    _passwordVisible = val;
    notifyListeners();
  }

  void submit(BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpScreen()));
      loading = false ;
      emailController.clear();
      notifyListeners();
    }

}