import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/widgets/ctegory_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 280.h,
        child:GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 100.h,
                  childAspectRatio: 100 / 144,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    CategoryItem(),
                itemCount: 5,
              )
        );
          }
}

