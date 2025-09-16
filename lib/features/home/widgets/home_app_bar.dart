import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/home_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final Function? onProfileTap;
  final HomeController controller = Get.find();

  HomeAppBar({Key? key,this.onProfileTap})
    : preferredSize = Size.fromHeight(56.h),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: GestureDetector(
            onTap: () {
              onProfileTap!();
            },
            child: Image.network(
              "https://avatar.iran.liara.run/public/36",
              width: 30.w,
              height: 30.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hi, Firad",
                  style: GoogleFonts.andika(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Welcome Back",
                  style: GoogleFonts.andika(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
