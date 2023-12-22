import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:safe_area/ui/Screens/splash/splash_screen_view_model.dart';
import 'package:safe_area/ui/theme/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin, SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(IMAGE_CONSTANTS.logo),
      ),
    );
  }
}
