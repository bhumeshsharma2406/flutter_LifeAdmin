import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),

        child: SafeArea(
          child: Column(
            children: [
              // Main Content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Icon
                    Container(
                      padding: const EdgeInsets.all(22),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.admin_panel_settings_rounded,
                        size: 75,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // App Name
                    Text(
                      "LifeAdmin",
                      style: AppTextStyles.heading1.copyWith(
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Subtitle
                    Text(
                      "Manage your life smarter",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Loading Indicator
                    const SizedBox(
                      height: 28,
                      width: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Section
              Padding(
                padding: const EdgeInsets.only(bottom: 20),

                child: Column(
                  children: [
                    // Version
                    Text(
                      "Version 1.0.0",
                      style: AppTextStyles.small.copyWith(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Copyright
                    Text(
                      "© 2026 LifeAdmin. All rights reserved.",
                      style: AppTextStyles.small.copyWith(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
