import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/input_field.dart';
import 'package:trans_help/res/components/large_button.dart';
import 'package:trans_help/viewmodels/registration_vm.dart';
import '../../res/components/custome_appbar.dart';
import '../../res/components/dropdown_widget.dart';
import '../../res/components/language_selection.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    RegistrationViewModel vm = context.watch<RegistrationViewModel>();
    return SafeArea
      (
      child: Scaffold(
        backgroundColor: AppColors.themColor,
        appBar:  CustomAppBar(
            titleText: AppLocalizations.of(context)!.registration
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(26),
          child:
          Form(
              key: vm.registrationFormKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(AppLocalizations.of(context)!.fullName,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  InputFiled(
                    controller: vm.fullName,
                    keyboard: TextInputType.text,
                    hintText: AppLocalizations.of(context)!.enterName,

                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Full Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.profession,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  DropdownFormField<String>(
                    hint: AppLocalizations.of(context)!.select,
                    items: vm.professions,
                    value: vm.selectedProfession,
                    displayItem: (item) => item,
                    validator: vm.validateProfessions,
                    onChanged: (newValue) {
                      vm.selectedProfession = newValue;
                      print('Selected Profession: ${vm.selectedProfession}');
                    },
                  ),
                   SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.degree,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                      SizedBox(width: 5.w),
                      Text(AppLocalizations.of(context)!.optional,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,color: AppColors.optionalColor),),
                    ],
                  ),
                  InputFiled(
                    controller: vm.degree,
                    keyboard: TextInputType.text,
                    hintText: AppLocalizations.of(context)!.enterDegree,

                    // validator: (val)
                    // {
                    //   if(val!.isEmpty)
                    //   {
                    //     return "Please Enter Degree";
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.email,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  InputFiled(
                    controller: vm.email,
                    keyboard: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.enterEmail,
                    validator: (val) => (!RegExp(
                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(val!))
                        ? "Please Enter a Valid Email"
                        : null,
                  ),
                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.mobile,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  InputFiled(
                    controller: vm.mobile,
                    keyboard: TextInputType.phone,
                    hintText: AppLocalizations.of(context)!.enterMobile,

                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Mobile";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      height: 20.h,
                      width: 135.w,
                      decoration: const BoxDecoration(
                          image:  DecorationImage(
                              image: AssetImage('lib/res/assets/images/p1.png'),
                              fit: BoxFit.fill
                          )),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  LargeButton(
                      title: AppLocalizations.of(context)!.next,
                      loading: vm.loading,
                      onPress: (){
                        vm.next(context);
                      }
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.language),
                        const SizedBox(width: 0,),
                        Text(AppLocalizations.of(context)!.language,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w600,),),
                        const SizedBox(width: 5,),

                      ]),
                  LanguageSelection(),

                ],)
          ),
        ),
      ),
    );

  }
}
