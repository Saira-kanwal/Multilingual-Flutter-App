
import 'package:flutter/material.dart';
import 'package:trans_help/res/components/custom_card.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: CustomCard()),
    );
  }
}
