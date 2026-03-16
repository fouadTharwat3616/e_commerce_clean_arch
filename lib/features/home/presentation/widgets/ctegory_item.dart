 import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/features/home/domain/entities/craegory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;
  const CategoryItem(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage:  CachedNetworkImageProvider(
           _category.image,
          ),
          radius: 50.r,
        ),
        SizedBox(height: 8.h),
        Text(
          _category.name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 14.sp,
            color: ColorsManager.darkPrimaryColor,
            fontWeight: FontWeight.normal,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
