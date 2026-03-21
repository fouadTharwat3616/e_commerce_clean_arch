import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce/features/product/presentation/cubit/product_cubit.dart';
import 'package:ecommerce/features/product/presentation/cubit/product_states.dart';
import 'package:ecommerce/features/product/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/product/presentation/widgets/product_item.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: serviceLocator.get<ProductCubit>()..getProducts()),
        BlocProvider.value(value: serviceLocator.get<CartCubit>()),
        BlocProvider.value(value: serviceLocator.get<WishListCubit>())
      ],
      child: BlocListener<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is AddToCartLoading) {
            UIUtils.showLoading(context);
          } else if (state is AddToCartSuccess) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage('Added to cart successfully');
          } else if (state is AddToCartError) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage('Failed to add product to cart');
          }
        },
        child: BlocListener<WishListCubit, WishlistStates>(
          listener: (context, state) {
            if (state is AddToWishlistLoading) {
              UIUtils.showLoading(context);
            } else if (state is AddToWishlistSuccess) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage('Added to wishlist successfully');
            } else if (state is AddToWishlistError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage('Failed to add product to wishlist');
            }
          },
          child: SafeArea(
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
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 18.h),
                  const SearchBarWithCart(),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: BlocBuilder<ProductCubit, ProductStates>(
                      builder: (context, state) {
                        if (state is GetProductLoading) {
                          return const LoadingIndicator();
                        } else if (state is GetProductError) {
                          return ErrorIndicator(state.message);
                        } else if (state is GetProductSuccess) {
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 2.5,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                            ),
                            itemCount: state.products.length,
                            itemBuilder: (_, index) {
                              final product = state.products[index];
                              return GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                  ProductDetailsScreen.routeName,
                                  arguments: product,
                                ),
                                child: ProductItem(product),
                              );
                            },
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}