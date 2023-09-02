import 'package:flutter/material.dart';
import 'package:notes_app/constant/constant.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final IconData icon;
  final validatorCallback validator;
  final voidCallback onTap;
  final bool readOnly;

  const CustomTextFromField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
    required this.onTap,
    required this.textInputType,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      readOnly: readOnly,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.deepOrange, width: 1),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFD7D9E0),
        suffixIcon: Icon(icon),
      ),
      validator: validator,
      onTap: onTap,
    );
  }
}
