import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/large_button.dart';
import '../../res/components/custome_appbar.dart';
import '../../res/components/otp_widget.dart';
import '../dashboard/dashboard_screen.dart';


class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);

  void _handleOtpSubmission(String otp) {
    // handle the OTP here as you did before in the previous example.
    print('OTP entered: $otp');
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.themColor,
            appBar:  CustomAppBar(
                titleText: AppLocalizations.of(context)!.forgetpswd
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Center(
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                          image:  DecorationImage(
                              image: AssetImage('lib/res/assets/images/otp.png'),
                              fit: BoxFit.cover
                          )),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.enterOtp,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,),),
                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.otpContent,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,),),
                  SizedBox(height: 30.h),
                  OtpInputWidget( onSubmit: _handleOtpSubmission,),
                  SizedBox(height: 30.h),
                  Center(child: Text(AppLocalizations.of(context)!.resendCode,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,),)),
                  SizedBox(height: 30.h),
                  LargeButton(
                      title: AppLocalizations.of(context)!.confirm,
                      onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                      }
                  ),

                ],),
            )
        )
    );
  }
}