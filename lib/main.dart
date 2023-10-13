import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trans_help/res/components/language_selection.dart';
import 'package:trans_help/res/fonts/app_fonts.dart';
import 'package:trans_help/viewmodels/forget_password_vm.dart';
import '../res/app_colors/app_color.dart';
import 'viewmodels/id_vierification_vm.dart';
import 'viewmodels/login_vm.dart';
import '../screens/splash/splash_screen.dart';
import 'services/language_provider.dart';
import 'viewmodels/new_password_vm.dart';
import 'viewmodels/registration_vm.dart';

// AppLanguage appLanguage = AppLanguage();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  final prefs = await SharedPreferences.getInstance();
  final String languageCode = prefs.getString('language_code') ?? '' ;
  runApp(  MyApp(locale: languageCode ));
}

class MyApp extends StatelessWidget {
  final String locale ;
  const MyApp({Key? key , required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    ScreenUtilInit(
        // designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {

      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppLanguage()),
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => RegistrationViewModel()),
          // ChangeNotifierProvider(create: (_) => MyAppLanguage()),
          ChangeNotifierProvider(create: (_) => IdViewModel()),
          ChangeNotifierProvider(create: (_) => ForgetPasswordVM()),
          ChangeNotifierProvider(create: (_) => NewPasswordVM()),

        ],
      child: Consumer<AppLanguage>(
        builder: (context, provider, child){
          if (provider.appLocale == null) {
            if (locale.isEmpty) {
              provider.changeLanguage(const Locale('en'));
            }
            else {
              provider.changeLanguage(Locale(locale));
            }
          }
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trans Help',
          theme: ThemeData(
            fontFamily: AppFonts.lexend,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor,),
            useMaterial3: true,
          ),
          // locale: provider.appLocale,
            locale: locale == '' ? const Locale( 'en') : provider.appLocale  ==  null ?  Locale(locale) :  Provider.of<AppLanguage>(context).appLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ur')
            ],
            home: const SplashScreen(),
          );
      }
      ));
        });
  }
}

