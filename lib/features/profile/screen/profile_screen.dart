import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/global_widget/custom_appbar.dart';
import '../../../core/global_widget/custom_text_view.dart';
import '../../../core/route/app_route.dart';
import '../../../core/utility/icon_path.dart';
import '../../../core/utility/app_colors.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.find();

  final profileItems = [
    {'image': IconPath.edit, 'title': 'Edit Profile'},
    {'image': IconPath.delete, 'title': 'Delete Account'},
    {'image': IconPath.logout, 'title': 'Logout'},
  ];

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: CustomAppBar(title: 'Profile', lead: false, center: true),
      body: RefreshIndicator(
        backgroundColor: AppColors.primaryColor,
        color: Colors.black,
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2));
        },
        child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: screenWidth * 0.2,
                          width: screenWidth * 0.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.nestBlue,
                              width: 1.r,
                            ),
                            image: DecorationImage(image: NetworkImage("https://avatar.iran.liara.run/public/36")),
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.14,
                          right: screenWidth * 0.01,
                          child: InkWell(
                            onTap: () {
                              controller.imagePickerController
                                  .pickFromStorage()
                                  .then((value) {
                                    controller.updateProfilePicture();
                                  });
                            },
                            child: Container(
                              width: 25.w,
                              height: 25.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                              ),
                              padding: EdgeInsets.all(5.w),
                              child: ClipOval(
                                child: Image.asset(
                                  IconPath.edit,
                                  width: 20.w,
                                  height: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    CustomTextView(
                      "Firad FD",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2d2d2d),
                    ),
                    CustomTextView(
                      "firadfd833@gmail.com",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff636F85),
                    ),
                    SizedBox(height: 20.h),
                    Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.toNamed(AppRoute.editProfile);
                            },
                            leading: Image.asset(
                              profileItems[0]['image']!,
                              width: 24.w,
                              color: Color(0xff636F85),
                            ),
                            title: CustomTextView(
                              profileItems[0]['title']!,
                              fontSize: 16.sp,
                              color: Color(0xff636F85),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Divider(thickness: 1.w, color: Color(0xFFF5F5F5)),
                          ListTile(
                            onTap: () {
                              controller.showDeleteDialog(
                                onConfirm: () {
                                  Get.offAllNamed(AppRoute.signIn);
                                  // controller.deleteUser().then((value){
                                  //   controller.sharedPreferencesHelper.clear();
                                  //   Get.offAllNamed(AppRoute.singUpPhone);
                                  // });
                                },
                              );
                            },
                            leading: Image.asset(
                              profileItems[1]['image']!,
                              width: 24.w,
                            ),
                            title: CustomTextView(
                              profileItems[1]['title']!,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff636F85),
                            ),
                          ),
                          Divider(thickness: 1.w, color: Color(0xFFF5F5F5)),
                          ListTile(
                            onTap: () {
                              controller.showLogoutDialog(
                                onConfirm: () {
                                  controller.sharedPreferencesHelper.clear();
                                  Get.offAllNamed(AppRoute.signIn);
                                },
                              );
                            },
                            leading: Image.asset(
                              profileItems[2]['image']!,
                              width: 24.w,
                              color: Colors.redAccent,
                            ),
                            title: CustomTextView(
                              profileItems[2]['title']!,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
