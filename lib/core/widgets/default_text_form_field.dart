import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    required this.hintText,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLength,
  });

  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLength;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: ColorsManager.whiteColor,
        filled: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => isObscure = !isObscure),
                icon: isObscure
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.blueGreyColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.blueGreyColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.blueGreyColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorsManager.greyColor,
            ),
      ),
      style: const TextStyle(
        color: ColorsManager.blackColor,
      ),
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? isObscure : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
    );
  }
}
