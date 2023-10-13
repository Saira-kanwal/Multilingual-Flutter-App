import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trans_help/res/app_colors/app_color.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 370.h,
      decoration: BoxDecoration(
        color: AppColors.themColor,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3), // Adjust the shadow offset if needed
          ),
        ],
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   backgroundColor: AppColors.primaryColor,
          //   radius: 30,
          //   backgroundImage: const AssetImage('lib/res/assets/images/tick_icon.png'),
          //   // child: Image.asset('lib/res/assets/images/tick.png'),
          // ),
          Text(AppLocalizations.of(context)!.verify,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,),),

        ],
      ),
    );
  }
}