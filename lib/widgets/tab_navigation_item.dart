import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vc_mall/screens/cart&orders.dart';
import 'package:vc_mall/screens/home_screen.dart';
import 'package:vc_mall/screens/profile_screen.dart';
import 'package:vc_mall/widgets/vertical_tab_bar.dart';



import '../config/app_settings.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Widget icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

//  Color colorByIndex(ThemeData theme, int index) {
//    return index == widget.menuIndex
//        ? theme.accentColor
//        : theme.primaryColorLight;
//  }

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomeScreen(),
          icon: SvgPicture.asset('assets/icons/bottom_menu/home.svg',
              height: 24.0, width: 24.0, color: Colors.blue),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 10.0, color: Colors.blue),
          ),
        ),
        TabNavigationItem(
          page: VerticalTabBar(),
          icon: SvgPicture.asset('assets/icons/bottom_menu/cart.svg',
              height: 24.0, width: 24.0, color: Colors.blue),
          title: Text(
            'Shop',
            style: TextStyle(fontSize: 10.0, color: Colors.blue),
          ),
        ),
        TabNavigationItem(
          page: CartsOrders(),
          icon: SvgPicture.asset('assets/icons/bottom_menu/bag.svg',
              height: 24.0, width: 24.0, color: Colors.blue),
          title: Text(
            'Bag',
            style: TextStyle(fontSize: 10.0, color: Colors.blue),
          ),
        ),
        TabNavigationItem(
          page: HomeScreen(),
          icon: SvgPicture.asset('assets/icons/bottom_menu/favorites.svg',
              height: 24.0, width: 24.0, color: Colors.blue),
          title: Text(
            'Favorites',
            style: TextStyle(fontSize: 10.0, color: Colors.blue),
          ),
        ),
        if (AppSettings.profileEnabled)
          TabNavigationItem(
            page:ProfileScreen(),
            icon: SvgPicture.asset('assets/icons/bottom_menu/profile.svg',
                height: 24.0, width: 24.0, color: Colors.blue),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 10.0, color: Colors.blue),
            ),
          ),
      ];
}
