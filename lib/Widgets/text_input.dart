import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final bool? filled;
  final double radius;
  final Color? borderColor;
  final String? hint;
  final EdgeInsets? padding;
  final bool secureText;
  final TextInputType? keyboard;
  final bool readOnly;

  const TextInput({
    Key? key,
    this.onTap,
    this.controller,
    this.onChanged,
    this.validator,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.filled,
    this.radius = 5,
    this.borderColor,
    this.hint,
    this.padding = const EdgeInsets.all(12),
    this.secureText = false,
    this.keyboard,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: secureText,
      keyboardType: keyboard,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: padding,
        hintText: hint,
        prefix: prefix,
        suffixIcon: suffix,
        fillColor: fillColor,
        filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          // borderSide: BorderSide(
          //   color: Get.theme.inputDecorationTheme.border!.borderSide.color,
          // ),
        ),
      ),
    );
  }
}
