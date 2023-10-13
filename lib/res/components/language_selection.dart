import  'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/language_provider.dart';
class LanguageItem {
  final String languageName;
  final Locale locale;

  LanguageItem({required this.languageName, required this.locale});
}
// enum Language {english , urdu}
class LanguageSelection extends StatelessWidget {
  final List<LanguageItem> languages = [
    LanguageItem(languageName: 'Urdu', locale: Locale('ur')),
    LanguageItem(languageName: 'English', locale: Locale('en')),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Consumer<AppLanguage>(
      builder: (context, provider, child) {
        return Container(
                  //  height: 60,
                  // width: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: ExpansionTile(

            title: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(provider.selectedLanguage,style: TextStyle(fontSize: 14),),
            ),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            children:
            languages.map((language) {
              return Container(
                  // height: 40,
                  // decoration: BoxDecoration(
                  //   border: Border.all(width: 1, color: Colors.grey),
                  // ),
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  title: Text(language.languageName),
                  onTap: () {
                    _changeLanguage(context, language.locale);
                    // Provider.of<AppLanguage>(context, listen: false).setLanguage(language.locale);

                  },
                ),
              );
            }).toList(),
          ),
        );
      }
    );

  }

  void _changeLanguage(BuildContext context, Locale locale) {
    final appLanguage = Provider.of<AppLanguage>(context, listen: false);
    appLanguage.changeLanguage(locale);
    if(locale.languageCode == 'en'){
                      appLanguage.selectedLanguage = 'English';
                    } else {
                      appLanguage.selectedLanguage = 'Urdu';
                    }
  }
}







//***********************************************************************
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class LanguageSelector<T> extends FormField<T> {
//   LanguageSelector({
//     Key? key,
//     required String labelText,
//     required T? value,
//     required List<DropdownMenuItem<T>> items,
//     required void Function(T?) onChanged,
//   }) : super(
//     key: key,
//     initialValue: value,
//     onSaved: onChanged,
//     builder: (FormFieldState<T> field) {
//       return InputDecorator(
//         decoration: InputDecoration(
//           labelText: labelText,
//           errorText: field.errorText,
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<T>(
//             value: field.value,
//             isDense: true,
//             onChanged: onChanged,
//             items: items,
//           ),
//         ),
//       );
//     },
//   );
// }
// class Language {
//   final String name;
//   const Language(this.name);
//
//   static const english = Language('English');
//   static const urdu = Language('Urdu');
// }
//
//
// class MyAppLanguage extends ChangeNotifier {
//   Locale _appLocale = Locale('en');
//   Locale get appLocale => _appLocale;
//
//   void changeLanguage(Locale newLocale) {
//     _appLocale = newLocale;
//     notifyListeners();
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Language Dropdown')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Consumer<MyAppLanguage>(
//           builder: (context, provider, child) {
//             return LanguageSelector<Language>(
//               labelText: AppLocalizations.of(context)!.enterPassword,
//               value: provider.appLocale == Locale('en') ? Language.english : Language.urdu,
//               items: const [
//                 DropdownMenuItem<Language>(
//                   value: Language.english,
//                   child: Text('English'),
//                 ),
//                 DropdownMenuItem<Language>(
//                   value: Language.urdu,
//                   child: Text('Urdu'),
//                 ),
//               ],
//               onChanged: (Language? selectedLanguage) {
//                 if (selectedLanguage != null) {
//                   if (selectedLanguage == Language.english) {
//                     provider.changeLanguage(Locale('en'));
//                   } else {
//                     provider.changeLanguage(Locale('ur'));
//                   }
//                 }
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }