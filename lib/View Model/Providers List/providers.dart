import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:roz/View%20Model/chat_provider.dart';
import 'package:roz/View%20Model/discover_provider.dart';
import 'package:roz/View%20Model/email_login_provider.dart';
import 'package:roz/View%20Model/location_provider.dart';
import 'package:roz/View%20Model/login_provider.dart';
import 'package:roz/View%20Model/message_provider.dart';
import 'package:roz/View%20Model/my_profile_provider.dart';
import 'package:roz/View%20Model/notification_provider.dart';
import 'package:roz/View%20Model/plans_provider.dart';
import 'package:roz/View%20Model/profile_details_provider.dart';
import 'package:roz/View%20Model/top_rated_provider.dart';
import 'package:roz/View%20Model/verify_code_provider.dart';

import '../app_provider.dart';

List<SingleChildWidget> providersList = [
  ChangeNotifierProvider(
    create: (context) => AppProvider()
      ..getSavedTheme()
      ..getSavedLanguage(),
  ),
  ChangeNotifierProvider(
    create: (context) => LoginProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => EmailLoginProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => VerifyCodeProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => ProfileDetailsProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => LocationProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => DiscoverProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => TopRatedProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => MessageProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => ChatProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => MessageProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => MyProfileProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => NotificationProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => PlansProvider(),
  ),
];
