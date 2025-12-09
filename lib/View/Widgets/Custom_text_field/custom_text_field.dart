import 'package:flutter/material.dart';

class CostomFromField extends StatelessWidget {
  String? hintText;
  String? labelText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  CostomFromField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        hintStyle: TextStyle(fontSize: 12, color: Color(0xff989898)),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
      ),
      validator: validator,
    );
  }
}