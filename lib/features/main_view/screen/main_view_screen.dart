import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/utility/IconPath.dart';
import '../../../core/utility/app_colors.dart';
import '../controller/main_view_controller.dart';

class MainViewScreen extends StatelessWidget {
  MainViewScreen({super.key});

  final MainViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentPage),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          elevation: 5.r,
          backgroundColor: AppColors.white,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: AppColors.primaryColor,
          items: [
            _bottomNavigationItem(
              controller.currentIndex.value == 0
                  ? IconPath.home_active
                  : IconPath.home_inactive,
              'Home',
            ),
            _bottomNavigationItem(
              controller.currentIndex.value == 1
                  ? IconPath.home_active
                  : IconPath.home_inactive,
              'Summery',
            ),
            _bottomNavigationItem(
              controller.currentIndex.value == 2
                  ? IconPath.profile_active
                  : IconPath.profile_inactive,
              'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationItem(
      String iconPath,
      String label,
      ) {
    return BottomNavigationBarItem(
      icon: SizedBox(height: 24.h, width: 24.w, child: Image.asset(iconPath)),
      label: label
    );
  }
}
