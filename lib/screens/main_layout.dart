import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // This will be the dynamic page content

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        title: InkWell(
          onTap: () => context.go('/'), // Clicking logo goes home
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Row(
              children: [
                const Icon(Icons.code, color: Color(0xFF1E3A8A), size: 32),
                const SizedBox(width: 12),
                const Text(
                  'Farwan Technologies',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/'),
            style: TextButton.styleFrom(foregroundColor: Colors.grey[800]),
            child: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 16),
          TextButton(
            onPressed: () => context.go('/products'),
            style: TextButton.styleFrom(foregroundColor: Colors.grey[800]),
            child: const Text(
              'Products',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: FilledButton(
              onPressed: () => context.go('/contact'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Contact Us'),
            ),
          ),
        ],
      ),
      // The dynamically loaded page is injected here
      body: child,
    );
  }
}
