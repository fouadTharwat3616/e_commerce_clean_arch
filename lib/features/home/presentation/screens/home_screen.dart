import 'package:ecommerce/features/home/presentation/widgets/home_tab.dart';
import 'package:ecommerce/features/home/presentation/widgets/nav_bar_icon.dart';
import 'package:ecommerce/features/product/presentation/widgets/products_tab.dart';
import 'package:ecommerce/features/profile/presentation/widgets/profile_tab.dart';
import 'package:ecommerce/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tabs = const [
    HomeTab(),
    ProductsTab(),
    WishListScreen(),
    ProfileTab(),
  ];
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(10),
          topEnd: Radius.circular(15),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(

            items: [
              BottomNavigationBarItem(
                icon: NavBarIcon(
                  imagePath: 'assets/images/home_icon.png',
                  isSelected: _currentTabIndex == 0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: NavBarIcon(
                  imagePath: 'assets/images/categories_icon.png',
                  isSelected: _currentTabIndex == 1,
                ),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: NavBarIcon(
                  imagePath: 'assets/images/wishlist_icon.png',
                  isSelected: _currentTabIndex == 2,
                ),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: NavBarIcon(
                  imagePath: 'assets/images/profile_icon.png',
                  isSelected: _currentTabIndex == 3,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) => setState(() => _currentTabIndex = index),
          ),
        ),
      ),
      body: _tabs[_currentTabIndex],
    );
  }
}
