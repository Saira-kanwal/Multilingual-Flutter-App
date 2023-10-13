import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/large_button.dart';
import '../../res/components/custome_appbar.dart';
import '../cong/cong_screen.dart';


class PictureVerificationScreen extends StatelessWidget {
  const PictureVerificationScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.themColor,
            appBar:  CustomAppBar(
                titleText: AppLocalizations.of(context)!.picVerification
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    height: 200.h,
                    width: 200.w,
                    decoration: const BoxDecoration(
                        image:  DecorationImage(
                            image: AssetImage('lib/res/assets/images/scan.png'),
                            fit: BoxFit.fill
                        )),
                  ),
                ),
               SizedBox(height: 70.h),
                LargeButton(
                    title: AppLocalizations.of(context)!.uploadPic,
                    onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CongratsScreen()));
                    }
                ),

              ],)
        )
    );
  }
}