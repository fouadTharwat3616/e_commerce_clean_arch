import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String routeName = '/wishlist';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final _getWishlistCubit = serviceLocator.get<WishListCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:_getWishlistCubit..getWishlist(),
      child:  BlocConsumer<WishListCubit, WishlistStates>(
          listener: (context, state) {
            if (state is DeleteFromWishlistLoading) {
              UIUtils.showLoading(context);
            } else if (state is DeleteFromWishlistError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage('Failed To Delete Product From WishList');
            } else if (state is DeleteFromWishlistSuccess) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage('Deleted From Wishlist Successfully');
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Image.asset(
                      'assets/images/logo.png',
                      color: Theme.of(context).primaryColor,
                      height: 22.h,
                      width: 66.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 18.h),
                    const SearchBarWithCart(),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (state is GetWishlistLoading && _getWishlistCubit.productsData.isEmpty) {
                            return const Center(child: LoadingIndicator());
                          }

                          if (state is GetWishlistError && _getWishlistCubit.productsData.isEmpty) {
                            return const Center(child: ErrorIndicator());
                          }
                          if(_getWishlistCubit.productsData.isEmpty)
                            {
                              return Center(
                                child: Text(
                                  'Your Wishlist is Empty',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: ColorsManager.darkPrimaryColor,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              );
                            }
                          return ListView.separated(
                            padding: EdgeInsets.only(bottom: 16.h),
                            itemBuilder: (_, index) => WishListItem(
                              wishListCubit: _getWishlistCubit,
                              data: _getWishlistCubit.productsData[index],
                            ),
                            separatorBuilder: (_, index) => SizedBox(height: 12.h),
                            itemCount: _getWishlistCubit.productsData.length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
