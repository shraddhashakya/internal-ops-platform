import 'package:desktalk/core/theme/colors.dart';
import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  final bool showButton1;
  final bool showButton2;
  final VoidCallback onChatPressed;
  final VoidCallback onDashboardPressed;

  const OnboardingButtons({super.key, required this.showButton1, required this.showButton2, required this.onChatPressed, required this.onDashboardPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: showButton1 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size.fromHeight(50), // height of 50 pixels
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // smaller corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16), // optional horizontal padding
                ),
                onPressed: onChatPressed,
                child: const Text(
                  'Start a Chat',
                  style: TextStyle(color: Color(0xFF232422), fontFamily: 'Verdana', fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: showButton2 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  minimumSize: const Size.fromHeight(50), // height of 50 pixels
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // smaller corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16), // optional horizontal padding
                ),
                onPressed: onDashboardPressed,
                child: const Text(
                  'Monitor Dashboard',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'Verdana', fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
