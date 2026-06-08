import 'package:flutter/material.dart';
import '../widgets/contact_form.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Reusing the agency theme colors
  static const Color _darkSlate = Color(0xFF0F172A);
  static const Color _primaryGreen = Color(0xFF059669);
  static const Color _lightGreen = Color(0xFFD1FAE5);
  static const Color _bgOffWhite = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Smoothly scale the horizontal padding
    final horizontalPadding = screenWidth > 800 ? screenWidth * 0.08 : 24.0;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: screenHeight - 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _buildHeader(context, horizontalPadding),
                _buildContactContent(context, horizontalPadding),
              ],
            ),
            _buildFooter(context, horizontalPadding),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      decoration: const BoxDecoration(color: _darkSlate),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Let\'s build something extraordinary together. Reach out to discuss your next project.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueGrey[200],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactContent(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      color: _bgOffWhite,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: Center(
        child: Wrap(
          spacing: 60,
          runSpacing: 60,
          alignment: WrapAlignment.center,
          children: [
            _buildContactInfo(context),
            // We wrap your Google Form widget in a SizedBox to prevent it from getting too wide
            const SizedBox(width: 500, child: ContactForm()),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: _darkSlate,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Whether you need a scalable web application, a seamless mobile experience, or cloud-native infrastructure, our engineering team is ready to deliver.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey[600],
              height: 1.6,
            ),
          ),
          const SizedBox(height: 48),
          const _InfoRow(
            icon: Icons.email_outlined,
            title: 'Email',
            detail:
                'support@farwantechnologies.com or farwantechnologies@gmail.com',
          ),
          const SizedBox(height: 32),
          const _InfoRow(
            icon: Icons.location_on_outlined,
            title: 'Headquarters',
            detail:
                'Available for global partnerships and remote collaboration.',
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1E293B),
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

// --- REUSABLE UI COMPONENT ---

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ContactScreen._lightGreen,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: ContactScreen._primaryGreen, size: 24),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ContactScreen._darkSlate,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                detail,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey[600],
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
