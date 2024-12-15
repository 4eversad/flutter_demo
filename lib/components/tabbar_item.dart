import 'package:flutter/material.dart';

class TabbarItem extends BottomNavigationBarItem {
  TabbarItem(String itemName, String iconName, {double? iconSize})
      : super(
          icon: Image.asset(
            'assets/images/tabbar/$iconName.png',
            width: iconSize,
            height: iconSize,
          ),
          activeIcon: Image.asset(
            'assets/images/tabbar/${iconName}_active.png',
            width: iconSize,
            height: iconSize,
          ),
          label: itemName,
        );
}
