import 'package:flutter/material.dart';
import '../screens/registration/registration_screen_2.dart';
import '../screens/verification/verify_process_screen.dart';

class RegistrationViewModel extends ChangeNotifier{
  GlobalKey<FormState> registrationFormKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController profession = TextEditingController();
  final TextEditingController degree = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController cnic = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool loading = false;

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  set passwordVisible (bool val)
  {
    _passwordVisible = val;
    notifyListeners();
  }

  final List<String> professions = ['Doctor' , 'Psychologist' , 'Lawyer'];
  String? selectedProfession;
  String? validateProfessions(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a Profession';
    }
    return null;
  }

  final List<String> countries = ['Pakistan' , 'Afghanistan' , 'Turkey'];
  String? selectedCountries;
  String? validateCountries(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a Country';
    }
    return null;
  }


  void next(BuildContext context){

    if (registrationFormKey1.currentState!.validate()){
      loading = true ;
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen2()));
      loading = false ;
      email.clear();
      profession.clear();
      degree.clear();
      fullName.clear();
      mobile.clear();
      notifyListeners();
    }
  }

  void registration(BuildContext context){

    if (registrationFormKey.currentState!.validate()){
      loading = true ;
      Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyProcessScreen()));
      loading = false ;
      cnic.clear();
      area.clear();
      password.clear();
      notifyListeners();
    }
  }


}