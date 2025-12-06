import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/onboarding_cubit.dart';
import 'cubit/onboarding_state.dart';
import 'widgets/typewriter_text.dart';
import 'widgets/onboarding_buttons.dart';
import '../../app/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit()..loadInitialData(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: TypewriterText(text: state.displayedText),
                  ),
                  const SizedBox(height: 40),
                  OnboardingButtons(
                    showButton1: state.showButton1,
                    showButton2: state.showButton2,
                    onChatPressed: () {
                      Navigator.pushNamed(context, AppRoutes.messaging);
                    },
                    onDashboardPressed: () {
                      Navigator.pushNamed(context, AppRoutes.dashboardWebview);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
