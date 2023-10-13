import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import '../../res/components/custome_appbar.dart';
import '../../res/components/verify_process_widget.dart';
import 'email_verification_screen.dart';
import 'id_verification_screen.dart';
import 'picture_verfication_screen.dart';


class VerifyProcessScreen extends StatefulWidget {
  const VerifyProcessScreen({Key? key}) : super(key: key);
  @override
  State<VerifyProcessScreen> createState() => _VerifyProcessScreenState();
}

class _VerifyProcessScreenState extends State<VerifyProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea
      (
      child: Scaffold(
        backgroundColor: AppColors.themColor,
        appBar:  CustomAppBar(
            titleText: AppLocalizations.of(context)!.verify
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(26),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 27.h),
              VerifyButton(
                icon: Image.asset('lib/res/assets/images/id_icon.png', width: 30.w,height: 30.h,),
                title: AppLocalizations.of(context)!.enterId,
                optional: '(Optional)',
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>   EmailVerificationScreen()));
                },
              ),

              SizedBox(height: 27.h),
              VerifyButton(
                  icon: Image.asset('lib/res/assets/images/scan_icon.png', width: 30.w,height: 30.h,),
                  title: AppLocalizations.of(context)!.scanPicture,
                  optional: '(Optional)',
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>   const PictureVerificationScreen()));
                  }
              ),

              SizedBox(height: 27.h),
              VerifyButton(
                  icon: Image.asset('lib/res/assets/images/lock_icon.png',  width: 30.w,height: 30.h,),
                  title: AppLocalizations.of(context)!.sendVerification,
                  optional: '',
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const IdVerificationScreen()));
                  }
              ),
            ],),
        ),
      ),
    );

  }
}
