import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Theme Colors
  static const Color _darkSlate = Color(0xFF0F172A);
  static const Color _primaryGreen = Color(0xFF059669);
  static const Color _lightGreen = Color(0xFFD1FAE5);
  static const Color _bgOffWhite = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    // Dynamic horizontal padding based on screen width to use the entire space
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 800 ? screenWidth * 0.08 : 24.0;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(context, horizontalPadding),
          _buildServicesSection(context, horizontalPadding),
          _buildWhyUsSection(context, horizontalPadding),
          _buildBottomCTA(context, horizontalPadding),
          _buildFooter(context, horizontalPadding),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 140, horizontal: padding),
      decoration: BoxDecoration(
        color: _darkSlate,
        // The hero image with a dark overlay for text readability
        image: DecorationImage(
          image: const AssetImage('assets/images/hero_bg.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            _darkSlate.withValues(alpha: 0.85),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Building Future-Ready\n',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 0.8,
              letterSpacing: -1,
            ),
          ),
          Text(
            'Digital Solutions',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: _primaryGreen,
              height: 1.0,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 800, // Keeps the reading line length comfortable
            child: Text(
              'Farwan Technologies architects robust, scalable software for web and mobile. We bridge the gap between complex business logic and elegant user experiences.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.blueGrey[200],
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              FilledButton(
                onPressed: () => context.go('/contact'),
                style: FilledButton.styleFrom(
                  backgroundColor: _primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Start a Project',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: _primaryGreen,
                  side: const BorderSide(color: _primaryGreen, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Our Capabilities',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      color: _bgOffWhite,
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Engineering Services',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: _darkSlate,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'End-to-end software development tailored to scale with your business complexity.',
            style: TextStyle(fontSize: 18, color: Colors.blueGrey[600]),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            children: const [
              _ServiceCard(
                icon: Icons.web,
                title: 'Custom Web Apps',
                description:
                    'High-performance single-page applications and complex web portals built with React, Vue, and modern web standards.',
              ),
              _ServiceCard(
                icon: Icons.phone_iphone,
                title: 'Native Mobile Development',
                description:
                    'Seamless iOS and Android experiences engineered in Swift, Kotlin, or cross-platform solutions like Flutter.',
              ),
              _ServiceCard(
                icon: Icons.cloud_queue,
                title: 'Cloud-Native Software',
                description:
                    'Scalable microservices, API development, and robust backend infrastructure deployed on AWS, GCP, or Azure.',
              ),
              _ServiceCard(
                icon: Icons.dataset_linked_outlined,
                title: 'Database Architecture',
                description:
                    'Secure, high-availability database design using PostgreSQL, Supabase, and custom logic pipelines.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWhyUsSection(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why Partner With Us',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: _darkSlate,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Precision-engineered codebases for the world\'s most demanding enterprises.',
            style: TextStyle(fontSize: 18, color: Colors.blueGrey[600]),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: const [
              _FeatureCard(
                title: 'Elite Engineering',
                description:
                    'Our team comprises dedicated full-stack developers and architects with a passion for shipping reliable enterprise software.',
                bgColor: _darkSlate,
                textColor: Colors.white,
                width: 450,
              ),
              _FeatureCard(
                title: 'Agile Delivery',
                description:
                    'Iterative development cycles ensuring rapid time-to-market and continuous value delivery.',
                bgColor: Color(0xFF6EE7B7),
                textColor: _darkSlate,
                width: 450,
              ),
              _FeatureCard(
                title: 'Scalable Architecture',
                description:
                    'We build systems designed to grow. No technical debt, just clean, modular codebases ready for tomorrow.',
                bgColor: _bgOffWhite,
                textColor: _darkSlate,
                width: 450,
              ),
              _FeatureCard(
                title: 'Transparent Process',
                description:
                    'Clear communication, direct access to developers, and absolute clarity on project milestones and timelines.',
                bgColor: Colors.white,
                textColor: _darkSlate,
                width: 450,
                hasBorder: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCTA(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      color: _bgOffWhite,
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: padding),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(64),
        decoration: BoxDecoration(
          color: _primaryGreen,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ready to build your next product?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Partner with Farwan Tech to bring your software vision to life.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () => context.go('/contact'),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: _primaryGreen,
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Discuss Your Idea',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1E293B),
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Farwan Technologies',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Precision-engineered software solutions for the modern era.',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 48),
          Divider(color: Colors.white.withValues(alpha: 0.1)),
          const SizedBox(height: 24),
          const Text(
            '© 2024 Farwan Technologies. Precision in Motion.',
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// --- REUSABLE UI COMPONENTS ---

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380, // Made wider to utilize screen space
      padding: const EdgeInsets.all(40), // Increased padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: HomeScreen._lightGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: HomeScreen._primaryGreen, size: 28),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: HomeScreen._darkSlate,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(color: Colors.blueGrey[600], height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final Color bgColor;
  final Color textColor;
  final double width;
  final bool hasBorder;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.bgColor,
    required this.textColor,
    required this.width,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: hasBorder
            ? Border.all(color: Colors.grey.withValues(alpha: 0.3))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: textColor.withValues(alpha: 0.8),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
