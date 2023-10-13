import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpInputWidget extends StatefulWidget {
  final Function(String) onSubmit;
  // final TextEditingController controller;

  const OtpInputWidget({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _OtpInputWidgetState createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  final TextEditingController _pinEditingController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void dispose() {
    _pinEditingController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinInputTextField(
      pinLength: 4,
      controller: _pinEditingController,
      focusNode: _pinFocusNode,
      decoration: BoxLooseDecoration(
        radius: Radius.zero,
        strokeColorBuilder: PinListenColorBuilder(Colors.grey.shade300, Colors.grey.shade300),
        strokeWidth: 40,
      ),
      autoFocus: true,
      textInputAction: TextInputAction.done,
      onSubmit: widget.onSubmit,
    );
  }
}

