import 'package:flutter/material.dart';

import '../app_themes.dart';
class AppCustomFormField extends StatelessWidget {
  String lable;
  TextEditingController textEditingController;
  TextInputType textInputType;
  AppCustomFormFieldBorderType appCustomFormFieldBorderType;
  String? Function(String?)? validator;
  Widget? suffixIcon;
  bool isObsecured;

  AppCustomFormField(
      {required this.lable,
        required this.textInputType,
        required this.textEditingController,
        required this.validator,
        this.appCustomFormFieldBorderType = AppCustomFormFieldBorderType.none,
        this.suffixIcon,
        this.isObsecured = false});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius;

    switch (appCustomFormFieldBorderType) {
      case AppCustomFormFieldBorderType.none:
        borderRadius = BorderRadius.zero;
        break;
      case AppCustomFormFieldBorderType.top:
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        );
        break;
      case AppCustomFormFieldBorderType.bottom:
        borderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        );
        break;
      case AppCustomFormFieldBorderType.all:
        borderRadius = BorderRadius.all(Radius.circular(8));
        break;
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: AppThemes.secondaryColor)),
      child: Padding(

        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
        child: TextFormField(
          validator: validator,
          controller: textEditingController,
          keyboardType: textInputType,
          obscureText: isObsecured,
          decoration: InputDecoration(
            isDense: true,
            suffix: suffixIcon,
            label: Text(lable),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

enum AppCustomFormFieldBorderType {
  none,
  top,
  bottom,
  all,
}
