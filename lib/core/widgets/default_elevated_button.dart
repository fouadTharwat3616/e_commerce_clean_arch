import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r)))),
      child: SizedBox(
        height: 64.h,
        width: 398.w,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorsManager.primaryColor,
                  fontSize: 20.sp,
                ),
          ),
        ),
      ),
    );
  }
}
