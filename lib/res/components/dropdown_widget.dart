import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trans_help/res/app_colors/app_color.dart';

class DropdownFormField<T> extends StatelessWidget {
  final String hint;
  final List<T> items;
  final T? value;
  final String Function(T) displayItem;
  final void Function(T?) onChanged;
  final String? Function(T?) validator;

  const DropdownFormField({super.key,
    required this.hint,
    required this.items,
    required this.value,
    required this.displayItem,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 52.h,
      width: 323.w,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0,1),
            // spreadRadius: 2,
            blurRadius: 5.0,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: DropdownButtonFormField<T>(
        elevation: 8,
        decoration: InputDecoration(
             hintText: hint,
            hintStyle:  TextStyle(fontWeight: FontWeight.w300,fontSize: 10.sp),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),

        value: value,
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(displayItem(item),style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),
          ));
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
