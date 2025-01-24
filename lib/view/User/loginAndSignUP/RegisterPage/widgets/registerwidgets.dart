import 'dart:developer';

import 'package:doctor_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

Widget textfieldsInRegister({
  String? hintText,
  TextEditingController? controllers,
  IconData? suffixIcon,
  IconData? prifixIcon,
  TextInputType? keyboardType,
  VoidCallback? password,
}) {
  return TextFormField(
    controller: controllers,
    keyboardType: keyboardType,
    decoration: InputDecoration(
        suffixIcon:
            IconButton(onPressed: () => password, icon: Icon(suffixIcon)),
        prefixIcon: Icon(prifixIcon),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsConstents.textBlackColor)),
        border: OutlineInputBorder()),
  );
}

Widget textfieldsInRegisterOb({
  String? hintText,
  TextEditingController? controllers,
  IconData? suffixIcon,
  IconData? prifixIcon,
  TextInputType? keyboardType,
  VoidCallback? password,
  required bool obsd,
}) {
  return TextFormField(
    obscureText: obsd,
    controller: controllers,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: password,
        icon: Icon(suffixIcon),
      ),
      prefixIcon: Icon(prifixIcon),
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsConstents.textBlackColor),
      ),
      border: OutlineInputBorder(),
    ),
  );
}
