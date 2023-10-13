import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/input_field.dart';
import 'package:trans_help/res/components/large_button.dart';
import '../../res/components/custome_appbar.dart';
import '../../viewmodels/forget_password_vm.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    ForgetPasswordVM vm = context.watch<ForgetPasswordVM>();
    return SafeArea
      (
      child: Scaffold(
        backgroundColor: AppColors.themColor,
        appBar:  CustomAppBar(
            titleText: AppLocalizations.of(context)!.forgetpswd
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(26),
          child:
          Form(
              key: vm.forgetPasswordFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Container(
                          height: 120.h,
                          width: 120.w,
                          decoration: const BoxDecoration(
                              image:  DecorationImage(
                                  image: AssetImage('lib/res/assets/images/reset_password.png'),
                                  fit: BoxFit.cover
                              )),
                        ),
                      ]
                  ),
                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.forgetPassword,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,),),
                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.forgetPasswordContent,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,),),
                  SizedBox(height: 30.h),
                  Text(AppLocalizations.of(context)!.emailNum,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  InputFiled(
                    controller: vm.emailController,
                    keyboard: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.emailNumHint,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter ID";
                      }
                      return null;
                    },
                    // InputFiled(
                    //   controller: vm.emailController,
                    //   keyboard: TextInputType.emailAddress,
                    //   hintText: AppLocalizations.of(context)!.enterEmail,
                    //   validator: (val) => (!RegExp(
                    //       "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    //       .hasMatch(val!))
                    //       ? "Please Enter a Valid Email"
                    //       : null,
                    // ),
                  ),
                  SizedBox(height: 10.h),

                  LargeButton(
                      title: AppLocalizations.of(context)!.confirm,
                      loading: vm.loading,
                      onPress: (){
                        vm.submit(context);
                        // vm.loginApi();
                      }
                  ),

                ],)
          ),
        ),
      ),
    );

  }
}
