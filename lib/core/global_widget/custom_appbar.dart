import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final bool? lead;
  final bool? center;
  final String? title;
  final Function? ontap;

  CustomAppBar({
    Key? key,
    this.title,
    this.lead,
    this.center = false,
    this.ontap,
  }) : preferredSize = Size.fromHeight(56.h),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: center,
      scrolledUnderElevation: 0,
      title: Text(
        title ?? "",
        style: GoogleFonts.andika(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      leading: lead == false
          ? const SizedBox.shrink()
          : InkWell(
              onTap: () {
                if (ontap != null) {
                  ontap!();
                } else {
                  Get.back();
                }
              },
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
    );
  }
}
