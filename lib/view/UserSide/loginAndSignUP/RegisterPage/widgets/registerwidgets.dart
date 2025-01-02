import 'package:doctor_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

Widget textfieldsInRegister({
  String? hintText,
  TextEditingController? controllers,
  IconData? suffixIcon,
  IconData? prifixIcon,
  TextInputType? keyboardType,
}) {
  return TextFormField(
    controller: controllers,
    keyboardType: keyboardType,
    decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsConstents.textBlackColor)),
        border: OutlineInputBorder()),
  );
}
