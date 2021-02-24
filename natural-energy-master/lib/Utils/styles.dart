import 'package:flutter/material.dart';
import 'colors.dart';

TextStyle ErrorTextStyle() {
  return const TextStyle(
    color: inputValidationColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}

TextStyle TextInputStyle(Color textColor) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textColor,
  );
}

BoxDecoration TextBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    border: Border.all(
      color: appTitleColor,
    ),
  );
}

InputDecoration TextFieldStyle(String hintText,
    {Widget prefixIcon, Widget suffixIcon}) {
  return InputDecoration(
    //hintText: hintText,
    // hintStyle: TextStyle(
    //   fontSize: 16,
    //   fontWeight: FontWeight.normal,
    //   color: textColor,
    // ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
    labelText: hintText,
    labelStyle: TextInputStyle(textColor),
    prefixIcon: prefixIcon == null ? null : prefixIcon,
    suffixIcon: suffixIcon == null ? null : suffixIcon,
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: inputControlColor)),
    disabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: inputControlColor)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: inputControlActiveColor),
    ),
    // contentPadding: const EdgeInsets.only(
    //   left: 10,
    // ),
  );
  
}
TextStyle tableHeaderStyle() {
    return const TextStyle(
        color: tableHeaderBorderColor,
        fontWeight: FontWeight.w600,
        fontSize: 16);
  }
