
import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';

class OtpTextField extends StatelessWidget {
  final OtpFieldControllerV2 otpController;
  final bool visible;
  final Function onCompleted;
  const OtpTextField({super.key, required this.otpController, required this.visible, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Visibility(
          visible: visible,
          child: OTPTextFieldV2(
              
              controller: otpController,
              length: 4,
              autoFocus: true,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: const TextStyle(fontSize: 17),
              onChanged: (pin) {
               
              },
              onCompleted: (pin) {
                onCompleted(pin);
              }),
        ),
      );
    
  }
}