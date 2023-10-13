import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/expansion_tile.dart';
import 'package:trans_help/res/components/input_field.dart';
import 'package:trans_help/res/components/large_button.dart';
import 'package:trans_help/viewmodels/registration_vm.dart';
import '../../res/components/custome_appbar.dart';
import '../../res/components/dropdown_widget.dart';
import '../../res/components/language_selection.dart';


class RegistrationScreen2 extends StatefulWidget {
  const RegistrationScreen2({Key? key}) : super(key: key);
  @override
  State<RegistrationScreen2> createState() => _RegistrationScreen2State();
}

class _RegistrationScreen2State extends State<RegistrationScreen2> {
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
              key: vm.registrationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.cnic,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                      SizedBox(width: 5.w),
                      Text(AppLocalizations.of(context)!.optional,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,color: AppColors.optionalColor),),
                    ],
                  ),
                  InputFiled(
                    controller: vm.cnic,
                    keyboard: TextInputType.text,
                    hintText: AppLocalizations.of(context)!.enterCNIC,
                    //
                    // validator: (val)
                    // {
                    //   if(val!.isEmpty)
                    //   {
                    //     return "Please Enter CNIC";
                    //   }
                    //   return null;
                    // },
                  ),

                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.country,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  DropdownFormField<String>(
                    hint: AppLocalizations.of(context)!.select,
                    items: vm.countries,
                    value: vm.selectedCountries,
                    displayItem: (item) => item,
                    validator: vm.validateCountries,
                    onChanged: (newValue) {
                      vm.selectedCountries = newValue;
                      if (kDebugMode) {
                        print('Selected Countries: ${vm.selectedCountries}');
                      }
                    },
                  ),

                  SizedBox(height: 10.h),
                  Text(AppLocalizations.of(context)!.area,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  InputFiled(
                    controller: vm.area,
                    keyboard: TextInputType.text,
                    hintText: AppLocalizations.of(context)!.enterArea,

                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter your area";
                      }
                      return null;
                    },
                  ),



                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.password,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                      SizedBox(width: 5.w),
                      Text(AppLocalizations.of(context)!.strong,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,color: AppColors.primaryColor),),
                    ],
                  ),
                  InputFiled(
                    controller: vm.password,
                    keyboard: TextInputType.text,
                    hintText: AppLocalizations.of(context)!.enterPassword,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                  ),

                  Center(
                    child: Container(
                      height: 20.h,
                      width: 135.w,
                      decoration: const BoxDecoration(
                          image:  DecorationImage(
                              image: AssetImage('lib/res/assets/images/p2.png'),
                              fit: BoxFit.fill
                          )),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  LargeButton(
                      title: AppLocalizations.of(context)!.signUp,
                      loading: vm.loading,
                      onPress: (){
                        vm.registration(context);
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
