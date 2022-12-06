import 'dart:async';
import 'package:flutter/material.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../Core/utils/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed(AppRouter.introRoute);
    });
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: context.height / 3,
          width: context.width -20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
