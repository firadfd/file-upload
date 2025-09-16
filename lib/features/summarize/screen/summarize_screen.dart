import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/global_widget/custom_appbar.dart';
import '../../../core/utility/app_colors.dart';
import '../controller/summarize_controller.dart';

class SummarizeScreen extends StatelessWidget {
  final SummarizeController controller = Get.find();

  SummarizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Summarize', lead: false, center: true),
      body: RefreshIndicator(
        backgroundColor: AppColors.primaryColor,
        color: Colors.black,
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(children: []),
          ),
        ),
      ),
    );
  }
}
