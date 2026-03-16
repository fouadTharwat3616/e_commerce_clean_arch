import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_state.dart';
import 'package:ecommerce/features/home/presentation/widgets/brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => serviceLocator.get<HomeCubit>()..getBrands(),
      child: SizedBox(
          height: 280.h,
          child: BlocBuilder<HomeCubit,HomeStates>(
            builder: (BuildContext context, state) {
              if ( state is GetBrandsLoading)
                {
                  return const LoadingIndicator();
                }
              else if (state is GetBrandsError)
                {
                  return const ErrorIndicator();
                }
              else if (state is GetBrandsSuccess)
                {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 100.h,
                      childAspectRatio: 100 / 144,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => BrandItem(state.Brands[index]),
                    itemCount: state.Brands.length,
                  );
                }
              else
                {
                  return const SizedBox();
                }
            },

          )
      ),
    );
  }
}
