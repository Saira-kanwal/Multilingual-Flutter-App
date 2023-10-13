import 'package:flutter/material.dart';
import '../screens/cong/cong_screen.dart';

class IdViewModel extends ChangeNotifier{

  GlobalKey<FormState> idFormKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final idFocusNode = FocusNode();
  bool loading = false;


  void confirm(BuildContext context){

      Navigator.push(context, MaterialPageRoute(builder: (context) => const CongratsScreen()));
      idController.clear();
      notifyListeners();
    }

}