import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_flow/categorysel.dart';
import 'package:tiktok_flow/resuable_components.dart';


// Screen 4: Business Introduction
class BusinessIntroScreen extends StatelessWidget {
  const BusinessIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Business Icon with decorative elements
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Decorative plus signs
                      const Positioned(
                        top: -20,
                        left: -20,
                        child: Text("+", style: TextStyle(color: Colors.red, fontSize: 20)),
                      ),
                      const Positioned(
                        top: -10,
                        right: -30,
                        child: Text("+", style: TextStyle(color: Colors.red, fontSize: 16)),
                      ),
                      const Positioned(
                        bottom: -15,
                        left: -30,
                        child: Text("+", style: TextStyle(color: Colors.red, fontSize: 18)),
                      ),
                      const Positioned(
                        bottom: -20,
                        right: -20,
                        child: Text("+", style: TextStyle(color: Colors.red, fontSize: 14)),
                      ),
                      // Store icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.store_outlined,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  
                  // Title
                  const Text(
                    "Business",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Feature list
                  const _BusinessFeature(
                    icon: Icons.analytics_outlined,
                    title: "Learn about your customers",
                    description: "Get insights on video performance and engagement to help you create content that converts.",
                  ),
                  const SizedBox(height: 32),
                  const _BusinessFeature(
                    icon: Icons.music_note_outlined,
                    title: "Access to exclusive sounds",
                    description: "Elevate your TikTok videos with a library of royalty-free sounds.",
                  ),
                  const SizedBox(height: 32),
                  const _BusinessFeature(
                    icon: Icons.lightbulb_outline,
                    title: "Get inspired",
                    description: "Get guidance and inspiration for your content in our Business Creative Hub.",
                  ),
                  const SizedBox(height: 32),
                  const _BusinessFeature(
                    icon: Icons.new_releases_outlined,
                    title: "Find out what's new",
                    description: "Leverage upcoming business features to grow your business in TikTok.",
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom section with Next button
          Container(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategorySelectionScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class _BusinessFeature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _BusinessFeature({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.grey,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}