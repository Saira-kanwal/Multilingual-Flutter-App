import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trans_help/res/app_colors/app_color.dart';
import 'package:trans_help/res/components/input_field.dart';
import 'package:trans_help/res/components/large_button.dart';
import '../../res/components/custome_appbar.dart';
import '../../viewmodels/id_vierification_vm.dart';


class IdVerificationScreen extends StatefulWidget {
  const IdVerificationScreen({Key? key}) : super(key: key);
  @override
  State<IdVerificationScreen> createState() => _IdVerificationScreenState();
}

class _IdVerificationScreenState extends State<IdVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    IdViewModel vm = context.watch<IdViewModel>();
    return SafeArea
      (
      child: Scaffold(
        backgroundColor: AppColors.themColor,
        appBar:  CustomAppBar(
            titleText: AppLocalizations.of(context)!.idVerification
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(26),
          child:
          Form(
              key: vm.idFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Text(AppLocalizations.of(context)!.idLabel,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,),),
                  SizedBox(height: 5.h),
                  InputFiled(
                    controller: vm.idController,
                    keyboard: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.idHint,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter ID";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50.h),

                  LargeButton(
                      title: AppLocalizations.of(context)!.confirm,
                      loading: vm.loading,
                      onPress: (){
                        vm.confirm(context);
                        // vm.loginApi();
                      }
                  ),

                ],)
          ),
        ),
      ),
    );

  }
}
