import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../features/forgot_pass/screen/create_new_pass_screen.dart';
import '../../features/forgot_pass/screen/forgot_otp_screen.dart';
import '../../features/forgot_pass/screen/forgot_pass_screen.dart';
import '../../features/forgot_pass/screen/pass_changed_screen.dart';
import '../../features/main_view/screen/main_view_screen.dart';
import '../../features/profile/screen/edit_profile_screen.dart';
import '../../features/sign_in/screen/sign_in_screen.dart';
import '../../features/sign_up/screen/sign_up_otp_screen.dart';
import '../../features/sign_up/screen/sign_up_screen.dart';
import '../../features/splash/screen/splash_screen.dart';

class AppRoute {
  static const String splash = '/SplashScreen';
  static const String signIn = '/SignInScreen';
  static const String signUp = '/SignUpScreen';
  static const String signOtp = '/SignOtpScreen';
  static const String forgotPassword = '/ForgotPasswordScreen';
  static const String forgotPasswordOtp = '/ForgotPasswordOtpScreen';
  static const String resetPassword = '/ResetPasswordScreen';
  static const String passwordChanged = '/PasswordChangedScreen';
  static const String mainView = '/MainViewScreen';
  static const String editProfile = '/EditProfileScreen';

  static final route = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: signIn,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signUp,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signOtp,
      page: () => SignUpOtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPassScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: forgotPasswordOtp,
      page: () => ForgotOtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: mainView,
      page: () => MainViewScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: resetPassword,
      page: () => CreateNewPassScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: passwordChanged,
      page: () => PasswordChangedScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: editProfile,
      page: () => EditProfileScreen(),
      transition: Transition.rightToLeft,
    ),

  ];
}
