import 'dart:async';

import 'package:get/get.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/route/app_route.dart';

class SplashController extends GetxController {
  final SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();

  @override
  Future<void> onInit() async {
    super.onInit();

    await preferencesHelper.init();

    final String? token = preferencesHelper.getString("userToken");
    await Future.delayed(const Duration(seconds: 1));

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoute.mainView);
    } else {
      Get.offAllNamed(AppRoute.signIn);
    }
  }
}
