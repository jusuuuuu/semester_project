import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

const forestGreen = Color(0xFF245C43);
const freshGreen = Color(0xFF4F805B);
const cream = Color(0xFFFAF8F0);

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
  ],
);

void main() {
  runApp(const LutoRecoApp());
}

class LutoRecoApp extends StatelessWidget {
  const LutoRecoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LutoReco',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: forestGreen,
          surface: cream,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: cream,
          foregroundColor: forestGreen,
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
