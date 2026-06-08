import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ContactService {
  // 1. TODO: Replace with your actual Google Form ID
  static const String _formId =
      '1FAIpQLScVuZyGPqO9E4ioZqeZMtSwwi3sZtfb9SerO0Yc6JArEM5PVw';

  // 2. TODO: Replace these with your actual entry IDs from the pre-filled link
  static const String _nameEntryId = 'entry.1008352493';
  static const String _emailEntryId = 'entry.1143420640';
  static const String _messageEntryId = 'entry.1319939836';

  /// Sends the contact form data headlessly to Google Forms.
  /// Returns true if successful, false if it failed.
  static Future<bool> sendMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    final String urlString =
        'https://docs.google.com/forms/d/e/$_formId/formResponse';

    try {
      final response = await http.post(
        Uri.parse(urlString),
        headers: {
          // Google Forms expects standard URL-encoded form data, not JSON
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          _nameEntryId: name,
          _emailEntryId: email,
          _messageEntryId: message,
        },
      );

      // Google Forms typically returns a 200 OK status on a successful headless submission
      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint('Google Form Error Status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('Network Error pointing to Google Forms: $e');
      return false;
    }
  }
}
