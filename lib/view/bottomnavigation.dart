import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapps/main.dart';
import 'package:musicapps/view/account.dart';
import 'package:musicapps/view/favoritemusic.dart';

import '../controller/topchartcontroller.dart';

class BottomNavigationBarPart extends StatefulWidget {
  const BottomNavigationBarPart({super.key});

  @override
  State<BottomNavigationBarPart> createState() =>
      _BottomNavigationBarPartState();
}

class _BottomNavigationBarPartState extends State<BottomNavigationBarPart> {
  // int _index = 0;
  OpenController openController = Get.put(OpenController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => openController.isloading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FloatingNavBar(
              resizeToAvoidBottomInset: false,
              color: Colors.grey.withOpacity(0.4),
              items: [
                FloatingNavBarItem(
                  iconData: Icons.home_filled,
                  title: 'Home',
                  page: MyApp(),
                ),
                FloatingNavBarItem(
                  iconData: Icons.favorite_border,
                  title: 'Favorite',
                  page: FavoriteMusic(),
                ),
                FloatingNavBarItem(
                  iconData: Icons.person,
                  title: 'Account',
                  page: UserAccount(),
                ),
              ],
              selectedIconColor: Colors.white,
              unselectedIconColor: Colors.grey,
              hapticFeedback: true,
              horizontalPadding: 30,
            ),
    );
  }
}
