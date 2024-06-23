import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project_mikti/final_project/ui/auth/Screens/Welcome/welcome_screen.dart';
import 'package:final_project_mikti/final_project/ui/home_page.dart';
import 'package:final_project_mikti/final_project/ui/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  final bool isLogin;
  final bool isOnboarding;

  const SplashScreen({
    super.key,
    required this.isLogin,
    required this.isOnboarding,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
          'assets/animation/splashLottie.json',
        ),
      ),
      nextScreen: isOnboarding
          ? (isLogin ? HomePage() : WelcomeScreen())
          : OnboardingView(),
      duration: 3000,
      backgroundColor: Colors.white,
      splashIconSize: 250,
    );
  }
}
