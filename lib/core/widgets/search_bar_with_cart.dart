import 'package:ecommerce/core/widgets/search_text_field.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWithCart extends StatelessWidget {
  const SearchBarWithCart();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SearchTextField()),
        SizedBox(width: 24.w),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          child: ImageIcon(
            const AssetImage('assets/images/cart_icon.png'),
            size: 28.sp,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
