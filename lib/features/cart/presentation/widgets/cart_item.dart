import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
   CartItemData cartItemData;
   final CartCubit cartCubit;
   CartItem( {super.key, required this.cartItemData,required this.cartCubit});



  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.w500);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorsManager.blueGreyColor),
        ),
        width: 398.w,
        height: 145.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ColorsManager.blueGreyColor),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: cartItemData.product.coverImageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              cartItemData.product.title,
                              style: titleMediumStyle?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          InkWell(
                            onTap: () {
                              cartCubit.deleteFromCart(cartItemData.product.id);
                            },
                            child: Icon(
                              Icons.delete_outline_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 28.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'EGP ${cartItemData.price}',
                              style: titleMediumStyle?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      if(cartItemData.count >1)
                                        {
                                          cartCubit.updateCart(cartItemData.product.id, cartItemData.count-1);
                                        }
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: ColorsManager.whiteColor,
                                      size: 28.sp,
                                    ),
                                  ),
                                  Text(
                                    '${cartItemData.count}',
                                    style: titleMediumStyle,
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => cartCubit.updateCart(cartItemData.product.id, cartItemData.count+1),
                                    icon: Icon(
                                      Icons.add_circle_outline_rounded,
                                      color: ColorsManager.whiteColor,
                                      size: 28.sp,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}