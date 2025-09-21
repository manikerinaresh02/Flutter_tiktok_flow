import 'package:flutter/material.dart';

import 'resuable_components.dart';

// Success/Confirmation Screen (Final screen)
class BusinessSuccessScreen extends StatelessWidget {
  final String selectedCategory;

  const BusinessSuccessScreen({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Navigate back to profile or main app
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success icon
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF00D4AA),
                ),
                child: const Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              
              // Success message
              const Text(
                "Welcome to Business Account!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
              Text(
                "You've successfully switched to a Business Account in the $selectedCategory category. You now have access to business features and insights!",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              PrimaryButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}