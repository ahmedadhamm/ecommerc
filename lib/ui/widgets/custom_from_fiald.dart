import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFromField extends StatelessWidget {
  String hint;
  Validator? validator;
  TextEditingController? controller;
  TextInputType keyboardType;
  bool hideText;
  CustomFromField(this.hint,
      {super.key,
      this.validator,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.hideText = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: hideText,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
