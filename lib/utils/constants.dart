import 'package:ecommerce_application/pages/tabs/cart_page.dart';
import 'package:ecommerce_application/pages/tabs/categories_page.dart';
import 'package:ecommerce_application/pages/tabs/home_page.dart';
import 'package:ecommerce_application/pages/tabs/profile_page.dart';
import 'package:ecommerce_application/pages/tabs/wishlist_page.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:flutter/material.dart';

const List<Widget> pages = [
    HomePage(),
    CategoriesPage(),
    CartPage(),
    WishlistPage(),
    ProfilePage(),
  ];
  const List<Map<String, dynamic>> navBarData = [
    {
      "label": "Home",
      "activeIcon": Images.homeFilledIcon,
      "icon": Images.homeIcon,
    },
    {
      "label": "Categories",
      "activeIcon": Images.exploreFilledIcon,
      "icon": Images.exploreIcon,
    },
    {
      "label": "My Cart",
      "activeIcon": Images.cartFilledIcon,
      "icon": Images.cartIcon,
    },
    {
      "label": "Wishlist",
      "activeIcon": Images.heartFilledIcon,
      "icon": Images.heartIcon,
    },
    {
      "label": "Profile",
      "activeIcon": Images.profileFilledIcon,
      "icon": Images.profileIcon,
    },
  ];