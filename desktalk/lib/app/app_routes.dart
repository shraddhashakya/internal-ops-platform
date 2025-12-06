import 'package:desktalk/features/messaging/cubit/messaging_cubit.dart';
import 'package:desktalk/features/messaging/data/message_repository.dart';
import 'package:desktalk/features/messaging/messaging_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desktalk/features/onboarding/onboarding_screen.dart';
import 'package:desktalk/features/dashboard_webview/cubit/dashboard_webview_cubit.dart';
import 'package:desktalk/features/dashboard_webview/dashboard_webview_screen.dart';

class AppRoutes {
  static const home = '/';
  static const messaging = '/messaging';
  static const dashboardWebview = '/dashboardWebview';

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      home: (_) => const OnboardingScreen(),

      messaging: (_) {
        final repo = context.read<MessageRepository>();

        return BlocProvider(
          create: (_) => MessagingCubit(repo: repo),
          child: const MessagingScreen(),
        );
      },

      dashboardWebview: (_) {
        return BlocProvider(create: (_) => DashboardWebviewCubit(), child: const DashboardWebviewScreen());
      },
    };
  }
}
