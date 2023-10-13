import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_color.dart';
import 'package:flutter/material.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    Key? key ,
    this.buttonColor = AppColors.primaryButtonColor ,
    this.textColor = AppColors.secondaryTextColor ,
    required this.title ,
    required this.icon ,
    required this.optional ,
    required this.onPress ,
    this.loading = false,
  })
      : super(key: key);

  final bool loading ;
  final String title ;
  final String optional ;
  final Image icon ;
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
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,1),
              blurRadius: 5.0,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        child: loading? const Center(child:  CircularProgressIndicator(color: AppColors.primaryColor,)) :
            ListTile(
              leading: icon,
              title: Row(
                children: [
                  Text(title, style:  TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp,color: AppColors.primaryTextColor)),
                  SizedBox(width: 10.h,),
                  Text(optional, style:  TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp,color: AppColors.optionalColor)),
                ],
              ),
              // trailing: Text('(Optional)', style:  TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp,color: AppColors.primaryColor)),
            ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Icon(Icons.person),
        //     Text(title, style:  Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primaryTextColor),),
        //   ],
        // ),
      ),
    );
  }
}
