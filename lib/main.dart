import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_match/presentations/views/home_page.dart';
import 'package:poke_match/presentations/views/matched_pokemon_list_page.dart';
import 'package:poke_match/presentations/views/widgets/app_bottom_navigation.dart';
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
      home: const BottomNavigator(),
    );
  }
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTapped: _onTabTapped,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  Widget buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const MatchedPokemonListPage();
      default:
        return Container();
    }
  }
}
