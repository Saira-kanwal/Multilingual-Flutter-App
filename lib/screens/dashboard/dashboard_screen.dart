import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.themColor,
          appBar:  AppBar(
            toolbarHeight: kToolbarHeight + 55.0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            // automaticallyImplyLeading: false,
            title: Text(AppLocalizations.of(context)!.login,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,height: 25.h),),
          ),
          body: const Center(
            child: Text('DashboardScreen')
          ),
        )
    );
  }
}

