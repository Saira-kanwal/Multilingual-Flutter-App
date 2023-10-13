import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import '../../repository/login_repository/login_repository.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/password/forget_password_screen.dart';

class LoginViewModel extends ChangeNotifier{
final _api = LoginRepository();

GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final emailFocusNode = FocusNode();
final passwordFocusNode = FocusNode();
bool loading = false;

bool _passwordVisible = false;
bool get passwordVisible => _passwordVisible;
set passwordVisible (bool val)
{
  _passwordVisible = val;
  notifyListeners();
}

void login(BuildContext context){

  if (loginFormKey.currentState!.validate()){
    loading = true ;
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
    loading = false ;
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }
}


  void forgetPassword(BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()));
      emailController.clear();
      passwordController.clear();
      notifyListeners();
  }

 void loginApi() async {
   loading = true ;
  if(loginFormKey.currentState!.validate()){
  Map data = {
    'email' : emailController.value.text,
    'password' : passwordController.value.text
  };
  _api.loginApi(data).then((value){
    loading = false ;
    if(value['error'] == 'user not found'){
      // Utils.snackBar(context: context, message: "User not found");
    } else {
      // Utils.snackBar('Login', 'Login Successfully');
    }
  }).onError((error, stackTrace) {
    loading = false ;
    // Utils.snackBar('Error', error.toString());

  });
  emailController.clear();
  passwordController.clear();
  notifyListeners();
  }

}
}