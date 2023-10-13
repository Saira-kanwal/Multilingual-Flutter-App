import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors/app_color.dart';

class InputFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final Widget? preIcon;
  final Widget? trailIcon;
  final TextInputType? keyboard;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool? readOnly;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String?Function(String?)? validator;


  const InputFiled(
      {super.key,  this.validator, required this.controller,this.obscureText, this.hintText, this.labelText, this.preIcon, this.trailIcon, this.keyboard, this.onTap, this.onChanged, this.readOnly, this.suffixIcon,});

  @override
  Widget build(BuildContext context) {
    return Container(
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

      child:
      TextFormField(
          controller: controller,
          readOnly: readOnly ?? false,
          keyboardType: keyboard ?? TextInputType.text,
          cursorHeight: 25,
          obscureText: obscureText ?? false,
          cursorColor: AppColors.greyColor,
          validator: validator,
          onTap: onTap,
          style: const TextStyle(color: Colors.black),
          onChanged: onChanged,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 10),
              hintText: hintText,
              hintStyle:  TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp),
              prefixIcon: preIcon,
              suffixIcon: trailIcon,
              label: labelText != null ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(labelText ?? "",
                  style: const TextStyle(color: AppColors.primaryTextColor),),
              ) : null,
                 border: InputBorder.none,
              // border: OutlineInputBorder(
              //     borderSide:  BorderSide(color: Colors.grey.shade50),
              //     gapPadding: 0,
              //     borderRadius: BorderRadius.circular(0)
              // ),
              // focusedBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.grey.shade50),
              //     gapPadding: 0,
              //     borderRadius: BorderRadius.circular(0)
              // ),
              // enabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.grey.shade50),
              //     gapPadding: 0,
              //     borderRadius: BorderRadius.circular(0)
              // )
          )
      ),
    );
  }
}


