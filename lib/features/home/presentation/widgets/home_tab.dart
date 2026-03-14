import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce/features/home/presentation/widgets/announcments_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/brands_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/ctegories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Image.asset(
                'assets/images/logo.png',
                color: Theme.of(context).primaryColor,
                height: 22.h,
                width: 66.w,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 18.h),
              const SearchBarWithCart(),
              SizedBox(height: 16.h),
              const AnnouncementsSection(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorsManager.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorsManager.darkPrimaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const CategoriesSection(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brands',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorsManager.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorsManager.darkPrimaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const BrandsSection(),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
