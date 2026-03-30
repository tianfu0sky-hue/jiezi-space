import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const JieziSpaceApp());
}

class JieziSpaceApp extends StatelessWidget {
  const JieziSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '芥子空间',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
