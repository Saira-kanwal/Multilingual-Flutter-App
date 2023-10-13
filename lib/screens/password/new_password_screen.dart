import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/input_field.dart';
import 'package:trans_help/res/components/large_button.dart';
import '../../res/components/custome_appbar.dart';
import '../../viewmodels/new_password_vm.dart';


class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    NewPasswordVM vm = context.watch<NewPasswordVM>();
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
              key: vm.newPasswordFormKey,
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
                                  image: AssetImage('lib/res/assets/images/password.png'),
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
                    controller: vm.newPasswordController,
                    obscureText: !vm.passwordVisible,
                    keyboard: TextInputType.text,
                    hintText: AppLocalizations.of(context)!.enterPassword,
                    trailIcon: IconButton(
                        iconSize: 20,
                        icon: Icon(vm.passwordVisible == true ?
                        Icons.visibility_outlined: Icons.visibility_off_outlined, color: AppColors.greyColor),
                        onPressed: () {
                          vm.passwordVisible = !vm.passwordVisible;
                        }),
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  Text(AppLocalizations.of(context)!.emailNum,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  InputFiled(
                    controller: vm.confirmPasswordController,
                    obscureText: !vm.passwordVisible,
                    keyboard: TextInputType.text,
                    hintText: AppLocalizations.of(context)!.enterPassword,
                    trailIcon: IconButton(
                        iconSize: 20,
                        icon: Icon(vm.passwordVisible == true ?
                        Icons.visibility_outlined: Icons.visibility_off_outlined, color: AppColors.greyColor),
                        onPressed: () {
                          vm.passwordVisible = !vm.passwordVisible;
                        }),
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),

                  LargeButton(
                      title: AppLocalizations.of(context)!.confirm,
                      loading: vm.loading,
                      onPress: (){
                        vm.confirm(context);
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
