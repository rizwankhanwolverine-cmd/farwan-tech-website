import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'screens/main_layout.dart';
import 'screens/home_screen.dart';
// We will create these two files in the next step
import 'screens/products_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const FarwanTechApp());
}

// Set up the GoRouter configuration
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    // The ShellRoute wraps all our pages in the MainLayout (the navigation bar)
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        // Route 1: Home Page (yoursite.com/)
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        // Route 2: Products Page (yoursite.com/products)
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsScreen(),
        ),
        // Route 3: Contact Page (yoursite.com/contact)
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactScreen(),
        ),
      ],
    ),
  ],
);

class FarwanTechApp extends StatelessWidget {
  const FarwanTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router is required when using go_router
    return MaterialApp.router(
      title: 'Farwan Technologies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A2540),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      // Pass the router config here
      routerConfig: _router,
    );
  }
}
