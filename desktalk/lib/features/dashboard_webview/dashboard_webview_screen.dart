import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/dashboard_webview_cubit.dart';
import 'cubit/dashboard_webview_state.dart';
import 'widgets/dashboard_webview_widget.dart';

class DashboardWebviewScreen extends StatelessWidget {
  const DashboardWebviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardWebviewCubit()..loadInitialData(),
      child: BlocBuilder<DashboardWebviewCubit, DashboardWebviewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          if (state.error != null) {
            return Scaffold(body: Center(child: Text('Error: ${state.error}')));
          }

          return Scaffold(
            appBar: AppBar(title: const Text('Internal Dashboard Webview')),
            body: DashboardWebviewWidget(url: state.url!),
          );
        },
      ),
    );
  }
}
