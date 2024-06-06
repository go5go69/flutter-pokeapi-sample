import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_match/presentations/views/home_page.dart';
import 'package:poke_match/themes/app_theme_data.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.light().themeData,
      darkTheme: AppThemeData.dark().themeData,
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
