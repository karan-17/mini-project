import 'package:flutter/material.dart';

textFormField(
    {TextEditingController? controller,
    void Function(String?)? onChanged,
    String? initialValue,
    String? Function(String?)? validator,
    required String labelText,
    required String hintText,
    required IconData icon,
    TextInputType? textInputType,
    bool? obscureText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          fontFamily: 'Muli',
          color: Color(0xffB9B9B9),
        ),
        hintStyle: TextStyle(
            fontFamily: 'Muli',
            color: Color(0xffB9B9B9),
            fontWeight: FontWeight.bold),
        errorStyle: TextStyle(
          fontFamily: 'Muli',
        ),
        suffixIcon: Icon(icon),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
  );
}
