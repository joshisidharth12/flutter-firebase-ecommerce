import 'package:flutter/material.dart';

import '../constants.dart';

class CustomInput extends StatelessWidget {

  final String hintText;
  final Function(String) onChange;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final bool isPasswordField;
  final TextInputAction textInputAction;
  CustomInput({this.hintText, this.onChange, this.onSubmitted, this.focusNode, this.textInputAction, this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(12)),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChange,
        onSubmitted: onSubmitted,
        obscureText: _isPasswordField,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? "Hint Text",
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24)),
        style: Constants.regulatDarkText,
      ),
    );
  }
}
