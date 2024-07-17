import 'package:flutter/material.dart';

void handleAPIError(BuildContext context,String errorMessage) {
  // Show a SnackBar or Dialog with the API-specific error message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('API error: $errorMessage'),
      backgroundColor: Colors.orangeAccent,
    ),
  );
}
void internetError(BuildContext context,String errorMessage) {
  // Show a SnackBar or Dialog with the API-specific error message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(' $errorMessage'),
      backgroundColor: Colors.orangeAccent,
    ),
  );
}
void handleUnExpectedError(BuildContext context,String errorMessage) {
  // Show a SnackBar or Dialog with the API-specific error message
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("An unexpected error occurred. Please try again later."),
      backgroundColor: Colors.orangeAccent,
    ),
  );
}