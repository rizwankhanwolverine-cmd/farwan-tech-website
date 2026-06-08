import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // Added to use debugPrint
// Adjust this import path if your models folder is located elsewhere
import '../models/project.dart';

class PortfolioService {
  /// Asynchronously loads the portfolio.json file from assets,
  /// decodes the JSON, and maps it into a List of Project objects.
  Future<List<Project>> loadProjects() async {
    try {
      // 1. Read the JSON file from the assets folder as a String
      final String response = await rootBundle.loadString(
        'assets/data/portfolio.json',
      );

      // 2. Decode the String into a Dart List of dynamic objects
      final List<dynamic> data = json.decode(response);

      // 3. Map the dynamic data into strongly typed Project models
      return data.map((jsonItem) => Project.fromJson(jsonItem)).toList();
    } catch (e) {
      // Replaced 'print' with 'debugPrint' to satisfy the Flutter linter
      debugPrint('Error loading portfolio data: $e');

      // Return an empty list as a fallback so the UI doesn't crash
      return [];
    }
  }
}
