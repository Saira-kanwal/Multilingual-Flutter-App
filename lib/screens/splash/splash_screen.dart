import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/small_button.dart';
import '../login/login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   _statTimer();
  //   super.initState();
  // }
  //
  // _statTimer()
  // {
  //   Future.delayed(const Duration(seconds: 10),_openScreen );
  // }
  //
  // _openScreen()
  // {
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.themColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  height: 350.h,
                  width: 249.w,
                  decoration: const BoxDecoration(
                  image:  DecorationImage(
                      image: AssetImage('lib/res/assets/images/Trans-help.png'),
                      fit: BoxFit.fill
                  )),
                ),
              ),
              SmallButton(
                  title: AppLocalizations.of(context)!.start,
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()));
                  }
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
            ],)
    )
    );
  }
}