import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/input_field.dart';
import 'package:trans_help/res/components/large_button.dart';
import 'package:trans_help/screens/registration/registration_screen_1.dart';
import '../../res/components/custome_appbar.dart';
import '../../viewmodels/login_vm.dart';
import '../../res/components/language_selection.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel vm = context.watch<LoginViewModel>();
    return SafeArea
        (
          child: Scaffold(
            backgroundColor: AppColors.themColor,
            appBar:  CustomAppBar(
                titleText: AppLocalizations.of(context)!.login
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(26),
              child:
              Form(
                key: vm.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Container(
                          // padding:  EdgeInsets.symmetric(horizontal: 76.w),
                          height: 150.h,
                          width: 187.w,
                          decoration: const BoxDecoration(
                              image:  DecorationImage(
                                  image: AssetImage('lib/res/assets/images/Trans-helppng.png'),
                                  fit: BoxFit.cover
                              )),
                        ),
                      ]
                    ),
                    Text(AppLocalizations.of(context)!.email,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                    InputFiled(
                      controller: vm.emailController,
                      keyboard: TextInputType.emailAddress,
                      hintText: AppLocalizations.of(context)!.enterEmail,
                      validator: (val) => (!RegExp(
                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(val!))
                          ? "Please Enter a Valid Email"
                          : null,
                    ),
                     SizedBox(height: 10.h),
                    Text(AppLocalizations.of(context)!.password,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                    InputFiled(
                      controller: vm.passwordController,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: (){
                              vm.forgetPassword(context);
                            },
                            child:Text(AppLocalizations.of(context)!.forgetPassword,style:TextStyle(color:AppColors.primaryTextColor,fontSize: 13.sp,fontWeight: FontWeight.w400)),
                        ),
                       ],
                    ),
                    LargeButton(
                        title: AppLocalizations.of(context)!.login,
                        loading: vm.loading,
                        onPress: (){
                          vm.login(context);
                          // vm.loginApi();
                        }
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.noAccount,style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w300,),),
                        TextButton(
                            style: const ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                            },
                            child: Text(AppLocalizations.of(context)!.register,style: TextStyle(color:AppColors.primaryTextColor,fontSize: 13.sp,fontWeight: FontWeight.w600,),)
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.language),
                        const SizedBox(width: 0,),
                        Text(AppLocalizations.of(context)!.language,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w600,),),
                        const SizedBox(width: 5,),


                       ]),
                    LanguageSelection(),
                    const SizedBox(height: 10,),

                  ],)
                  ),
              ),
        ),
      );

  }
}
