import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/route/app_route.dart';
import '../../../core/utility/app_colors.dart';
import '../controller/home_controller.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onProfileTap: () {
          Get.toNamed(AppRoute.editProfile);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white, size: 20.sp),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.primaryColor,
        color: Colors.black,
        onRefresh: () async {
          await Future.wait([]);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(children: []),
          ),
        ),
      ),
    );
  }
}
