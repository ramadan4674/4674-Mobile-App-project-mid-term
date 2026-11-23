import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      autocorrect: !isPassword,
      enableSuggestions: !isPassword,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
    );
  }
}
