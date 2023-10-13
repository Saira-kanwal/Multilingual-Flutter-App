import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_colors/app_color.dart';

class ProfessionItem {
  final String profession;

  ProfessionItem({required this.profession});
}

class ProfessionSelection extends StatelessWidget {
  final List<ProfessionItem> professions = [
    ProfessionItem(profession: "Doctor"),
    ProfessionItem(profession: "Psychologist"),
    ProfessionItem(profession: "Lawyer"),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Container(
        // height: 45.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,3),
              blurRadius: 10.0,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(AppLocalizations.of(context)!.select,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.normal,color: Colors.grey.shade700),),
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          children: professions.map((profession) {
            return Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade300),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(profession.profession,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.normal,color: Colors.grey.shade700)),
                ),
                onTap: () {

                },
              ),
            );
          }).toList(),
        ),
      );
  }


}
