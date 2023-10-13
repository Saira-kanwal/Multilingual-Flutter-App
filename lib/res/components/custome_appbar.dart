import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  const CustomAppBar(  {Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding:  EdgeInsets.fromLTRB(10.w, 40.h, 10.w, 0),
      child:
      ListTile(
        title: Center(
          child: Text(titleText,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
        ),
        leading: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.themColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(4, 4), // Bottom-right shadow
              ),
            ],
          ),
          child: Center(
            child: IconButton(
              splashRadius: 1,
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),

            ),
          ),
        ),
        tileColor: AppColors.themColor,
        textColor: AppColors.primaryTextColor,
      )
    );

    //   AppBar(
    //   title: Text(titleText,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,height: 25.h),),
    //   centerTitle: true,
    //   toolbarHeight: kToolbarHeight + 55.0,
    //   backgroundColor: Colors.white,
    //   leading: Container(
    //     height: 20.h,
    //     width: 20.w,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: AppColors.themColor,
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.shade300,
    //           blurRadius: 10,
    //           spreadRadius: 2,
    //           offset: Offset(4, 4), // Bottom-right shadow
    //         ),
    //       ],
    //     ),
    //     child: IconButton(
    //       splashRadius: 1,
    //       splashColor: Colors.transparent,
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       icon: const Icon(Icons.arrow_back_ios),
    //
    //     ),
    //   ),
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
