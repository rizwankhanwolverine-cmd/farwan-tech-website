import 'package:flutter/material.dart';
import '../models/project.dart';
import '../services/portfolio_service.dart';
import '../widgets/project_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Project>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the service call once when the screen loads
    _projectsFuture = PortfolioService().loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Farwan Technologies',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.5),
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Services')),
          TextButton(onPressed: () {}, child: const Text('Products')),
          TextButton(onPressed: () {}, child: const Text('Contact Us')),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 60),
            _buildProductsSection(context),
            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Theme.of(
        context,
      ).colorScheme.primaryContainer.withValues(alpha: 0.3),
      child: Column(
        children: [
          Text(
            'Enterprise Software & App Development',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'We build scalable digital solutions for modern businesses.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Products',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          FutureBuilder<List<Project>>(
            future: _projectsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
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

              // Wrap allows the cards to flow responsively on desktop, tablet, and mobile
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.start,
                children: products
                    .map((project) => ProjectCard(project: project))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
