import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../home/screen/home_screen.dart';
import '../../profile/screen/profile_screen.dart';


class MainViewController extends GetxController {
  var currentIndex = 0.obs;

  final screens = [
    HomeScreen(),
    ProfileScreen(),
    ProfileScreen()
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  Widget get currentPage => screens[currentIndex.value];
}