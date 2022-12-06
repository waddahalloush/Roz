import 'package:flutter/cupertino.dart';
import 'package:roz/View/Screens/block_list_screen.dart';
import 'package:roz/View/Screens/contact_us_screen.dart';
import 'package:roz/View/Screens/edit_profile_screen.dart';
import 'package:roz/View/Screens/email_login_screen.dart';
import 'package:roz/View/Screens/intro_screen.dart';
import 'package:roz/View/Screens/like_intrest_screen.dart';
import 'package:roz/View/Screens/location_screen.dart';
import 'package:roz/View/Screens/login_screen.dart';
import 'package:roz/View/Screens/matching_screen.dart';
import 'package:roz/View/Screens/notification_screen.dart';
import 'package:roz/View/Screens/roz_app_settings_screen.dart';
import 'package:roz/View/Screens/splash_screen.dart';
import 'package:roz/View/Screens/start_dating_screen.dart';
import 'package:roz/View/Screens/terms_screen.dart';
import 'package:roz/View/Screens/verify_code_screen.dart';
import 'package:roz/View/Screens/video_calling_screen.dart';
import '../../View/Screens/my_home_screen.dart';
import '../../View/Screens/plans_screen.dart';
import '../../View/Screens/profile_detail_screen.dart';
import '../../View/Screens/upload_id_screen.dart';
import 'Animation Page/scale_transition.dart';

class AppRouter {
  static const splashRoute = "/splash";
  static const introRoute = '/intro';
  static const startDatingRoute = '/startDating';
  static const loginRoute = '/login';
  static const emailloginRoute = '/email';
  static const verifyCodeRoute = '/verify';
  static const profileRoute = '/profile';
  static const likeRoute = '/like';
  static const uploadIdRoute = '/uploadId';
  static const locationRoute = '/location';
  static const homeRoute = '/home';
  static const plansRoute = '/plans';
  static const rozSettingRoute = '/rozSetting';
  static const chatRoute = '/chatRoute';
  static const editProfileRoute = '/editProfileRoute';
  static const userProfileRoute = '/userProfileRoute';
  static const blockListRoute = '/blockListRoute';
  static const contactUsRoute = '/contactUsRoute';
  static const notifiacationRoute = '/notifiacationRoute';
  static const videocallRoute = '/videocallRoute';
  static const termsRoute = '/termsRoute';
  static const matchRoute = '/matchRoute';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case introRoute:
        return CupertinoPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case startDatingRoute:
        return CupertinoPageRoute(
          builder: (context) => const StartDatingScreen(),
        );
      case loginRoute:
        return CupertinoPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case emailloginRoute:
        return CupertinoPageRoute(
          builder: (context) => const EmailLoginScreen(),
        );

      case verifyCodeRoute:
        return CupertinoPageRoute(
          builder: (context) => const VerifyCodeScreen(),
        );
      case profileRoute:
        return CupertinoPageRoute(
          builder: (context) => const ProfileDetailScreen(),
        );
      case likeRoute:
        return CupertinoPageRoute(
          builder: (context) => const LikeIntrestScreen(),
        );
      case uploadIdRoute:
        return CupertinoPageRoute(
          builder: (context) => const UploadIdScreen(),
        );
      case locationRoute:
        return CupertinoPageRoute(
          builder: (context) => const LocationScreen(),
        );
      case homeRoute:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case plansRoute:
        return CupertinoPageRoute(
          builder: (context) => const PlansScreen(),
        );
      case rozSettingRoute:
        return CupertinoPageRoute(
          builder: (context) => const RozAppSettingsScreen(),
        );

      case editProfileRoute:
        return CupertinoPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case blockListRoute:
        return CupertinoPageRoute(
          builder: (context) => const BlockListScreen(),
        );
      case contactUsRoute:
        return CupertinoPageRoute(
          builder: (context) => const ContactUsScreen(),
        );
      case notifiacationRoute:
        return CupertinoPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case videocallRoute:
        return ScaleRoute(
          page: const VideoCallingScreen(),
        );
      case termsRoute:
        return CupertinoPageRoute(
          builder: (context) => const TermsScreen(),
        );
      case matchRoute:
        return CupertinoPageRoute(
          builder: (context) => const MatchingScreen(),
        );
    }
    return null;
  }
}
