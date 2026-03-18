import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String routeName = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  //final _cartCubit = serviceLocator.get<CartCubit>();

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context).textTheme.titleMedium;
    final readMoreTextStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.darkPrimaryColor,
    );
    final Args = ModalRoute.of(context)!.settings.arguments as Product;
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 28.sp,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {

              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 28.sp,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 16.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: ColorsManager.blueGreyColor,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 0.97,
                      ),
                      itemBuilder: (_, index, __) => CachedNetworkImage(
                        height: 300.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: Args.imageCover!,
                      ),
                      itemCount:5,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        Args.title!,
                        style: titleMediumStyle?.copyWith(
                          color: ColorsManager.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'EGP ${Args.price}',
                      style: titleMediumStyle?.copyWith(
                        color: ColorsManager.darkPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: ColorsManager.blueGreyColor),
                            ),
                            child: Text(
                              '${Args.sold} Sold',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                fontSize: 14.sp,
                                color: ColorsManager.darkPrimaryColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          const ImageIcon(
                            AssetImage('assets/images/star_icon.png'),
                            color: ColorsManager.yellowColor,
                            size: 16,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '',
                            style: titleMediumStyle?.copyWith(
                              fontSize: 14.sp,
                              color: ColorsManager.darkPrimaryColor,
                            ),
                          )
                        ],
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: ColorsManager.whiteColor,
                              size: 28.sp,
                            ),
                          ),
                          Text(
                            '1',
                            style: titleMediumStyle,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline_rounded,
                              color: ColorsManager.whiteColor,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'Description',
                  style: titleMediumStyle?.copyWith(
                    color: ColorsManager.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                ReadMoreText(
                  Args.description!,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  style: readMoreTextStyle.copyWith(
                    color: ColorsManager.blueColor,
                  ),
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                  moreStyle: readMoreTextStyle,
                  lessStyle: readMoreTextStyle,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total price',
                          style: titleMediumStyle?.copyWith(
                            color: ColorsManager.blueColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'EGP ${Args.price}',
                          style: titleMediumStyle?.copyWith(
                            color: ColorsManager.darkPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 32.w),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.darkPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.add_shopping_cart_outlined,
                                color: ColorsManager.whiteColor,
                              ),
                              Text(
                                'Add to cart',
                                style: titleMediumStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}

