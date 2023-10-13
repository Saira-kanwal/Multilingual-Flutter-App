import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_color.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    Key? key ,
    this.buttonColor = AppColors.primaryButtonColor ,
    this.textColor = AppColors.secondaryTextColor ,
    required this.title ,
    required this.onPress ,
    this.loading = false,
  })
      : super(key: key);

  final bool loading ;
  final String title ;
  // final double height , width ;
  final VoidCallback onPress ;
  final Color textColor, buttonColor ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPress();
      } ,
      child: Container(
        height: 45.h,
        width: 323.w,
        decoration: BoxDecoration(
            color: buttonColor,
        ),
        child: loading? const Center(child:  CircularProgressIndicator(color: AppColors.themColor,)) :
        Center(
            child: Text(title, style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.secondaryTextColor),)
        ),
      ),
    );
  }
}
