import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class FilledRoundedPinPut extends StatefulWidget {
  final TextEditingController controller;
  const FilledRoundedPinPut({Key? key, required this.controller})
      : super(key: key);

  @override
  State<FilledRoundedPinPut> createState() => _FilledRoundedPinPutState();
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  // final controller = TextEditingController();
  final focusNode = FocusNode();

  // @override
  // void dispose() {
  //   widget.controller.dispose();
  //   focusNode.dispose();
  //   super.dispose();
  // }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 4;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      // textStyle: GoogleFonts.poppins(
      //   fontSize: 22,
      //   color: Color.fromRGBO(30, 60, 87, 1),
      // ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 68,
      child: Pinput(
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        length: length,
        controller: widget.controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => showError = pin != '5555');
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68,
          width: 64,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
