import 'package:flutter/material.dart';
import '../models/project.dart';
import '../services/portfolio_service.dart';
import '../widgets/project_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Project>> _projectsFuture;

  // Reusing the agency theme colors
  static const Color _darkSlate = Color(0xFF0F172A);
  static const Color _primaryGreen = Color(0xFF059669);
  static const Color _bgOffWhite = Color(0xFFF8FAFC);

  @override
  void initState() {
    super.initState();
    _projectsFuture = PortfolioService().loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    // Dynamically calculate screen size for perfect scaling
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Smoothly scale the horizontal padding based on screen width
    final horizontalPadding = screenWidth > 800 ? screenWidth * 0.08 : 24.0;

    return SingleChildScrollView(
      child: ConstrainedBox(
        // Ensures the footer always stays at the bottom even if you only have 1 product
        constraints: BoxConstraints(minHeight: screenHeight - 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _buildHeader(context, horizontalPadding),
                _buildProductGrid(context, horizontalPadding),
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
            'Our Products',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Explore our flagship applications. Built for scale, designed for impact.',
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

  Widget _buildProductGrid(BuildContext context, double padding) {
    return Container(
      width: double.infinity,
      color: _bgOffWhite,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: padding),
      child: FutureBuilder<List<Project>>(
        future: _projectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: CircularProgressIndicator(color: _primaryGreen),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading products: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No products available right now.'),
            );
          }

          final products = snapshot.data!;

          // Wrap automatically moves cards to the next line based on available width
          return Center(
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: products
                  .map((project) => ProjectCard(project: project))
                  .toList(),
            ),
          );
        },
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
