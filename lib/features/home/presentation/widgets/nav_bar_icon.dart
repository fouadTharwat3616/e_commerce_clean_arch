import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    required this.imagePath,
    required this.isSelected,
  });

  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager. whiteColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(4),
      child: ImageIcon(
        AssetImage(imagePath),
        color:
            isSelected ? Theme.of(context).primaryColor : ColorsManager.whiteColor,
      ),
    );
  }
}
