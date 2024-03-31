import 'package:flutter/material.dart';

class TextFieldsWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool ischeckPassword;
  final String hintText;
  final TextInputType keybordTupe;
  const TextFieldsWidget({
    Key? key,
    required this.hintText,
    this.ischeckPassword = false,
    required this.keybordTupe,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        obscureText: ischeckPassword,
        keyboardType: keybordTupe,
      ),
    );
  }
}
