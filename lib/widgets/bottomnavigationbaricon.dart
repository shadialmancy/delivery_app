import 'package:delivery_app/screens/homepage/home_page.dart';
import 'package:delivery_app/screens/profilepage/profile_page.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> bnbIcons = [
  {
    "name": "Home",
    "icon": Icons.home,
    "iconSelected": Icons.home_outlined,
    "isSelected": true,
    "screen": const HomePage()
  },
  {
    "name": "Order",
    "icon": Icons.fastfood,
    "iconSelected": Icons.fastfood_outlined,
    "isSelected": false,
    "screen": const HomePage()
  },
  {
    "name": "My List",
    "icon": Icons.bookmark,
    "iconSelected": Icons.bookmark_border,
    "isSelected": false,
    "screen": const HomePage()
  },
  {
    "name": "Profile",
    "icon": Icons.person,
    "iconSelected": Icons.person_outline,
    "isSelected": false,
    "screen": const ProfilePage()
  },
];
