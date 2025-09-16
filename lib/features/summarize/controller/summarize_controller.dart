import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/global_widget/image_picker_controller.dart';
import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/service_class/network_caller/repository/network_caller.dart';
import '../../../core/utility/app_colors.dart';
import '../../../core/utility/app_urls.dart';
import '../../home/controller/home_controller.dart';

class SummarizeController extends GetxController {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();


  @override
  Future<void> onInit() async {
    super.onInit();
    await sharedPreferencesHelper.init();
  }


}
