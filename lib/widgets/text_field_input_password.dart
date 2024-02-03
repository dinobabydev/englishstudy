import 'package:flutter/material.dart';

class TextFieldInputPassword extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass ;
  final String hintText;
  final TextInputType textInputType;
  final IconData iconData;
  final Function() method;
  const TextFieldInputPassword({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.isPass = false,
    required this.iconData,
    required this.method,
  });



  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context)
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: IconButton(
          icon: Icon(iconData),
          onPressed: method,
        )
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
