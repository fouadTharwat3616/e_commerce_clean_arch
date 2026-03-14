import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: const CachedNetworkImageProvider(
                'assets/images/home_icon.png'
            ),
            radius: 50.r,
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          flex: 2,
          child: Text(
            'brand.name',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 14.sp,
              color: ColorsManager.darkPrimaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
