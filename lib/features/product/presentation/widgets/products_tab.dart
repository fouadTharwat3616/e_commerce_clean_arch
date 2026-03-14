import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              //const SearchBarWithCart(),
              SizedBox(height: 16.h),
             /* Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is GetProductsLoading) {
                      return const LoadingIndicator();
                    } else if (state is GetProductsError) {
                      return ErrorIndicator(state.message);
                    } else if (state is GetProductsSuccess) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.5,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                        ),
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDetailsScreen.routeName,
                              arguments: state.products[index],
                            );
                          },
                          child: ProductItem(state.products[index]),
                        ),
                        itemCount: state.products.length,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),*/
            ],
          ),
        ),
    );
  }
}