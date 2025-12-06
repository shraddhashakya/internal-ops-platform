import 'package:desktalk/app/app_routes.dart';
import 'package:desktalk/core/theme/app_theme.dart';
import 'package:desktalk/features/messaging/data/message_repository.dart';
import 'package:desktalk/features/messaging/data/message_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('messages_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => MessageRepository(MessageStorage()),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            themeMode: ThemeMode.system, // follow device dark/light
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.home,
            routes: AppRoutes.routes(context),
          );
        },
      ),
    );
  }
}
