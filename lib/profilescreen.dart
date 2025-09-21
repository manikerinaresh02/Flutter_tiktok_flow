// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tiktok_flow/resuable_components.dart';
import 'package:tiktok_flow/settings.dart';

// Screen 1: Profile Screen (Starting point - simplified version of what we see)
class ProfileScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TikTokAppBar(
        title: "Johnmobbin",
        showBackButton: false,
        trailing: Container(
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.menu, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE0E0E0),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "@johnmobbin",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatItem(count: "0", label: "Following"),
                      _StatItem(count: "0", label: "Followers"),
                      _StatItem(count: "0", label: "Likes"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Edit Profile Button
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE1E1E1)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Edit profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Settings Section
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SettingsItem(
                    icon: Icons.people_outline,
                    title: "Creator tools",
                    onTap: () {},
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "•",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  SettingsItem(
                    icon: Icons.settings_outlined,
                    title: "Settings and privacy",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({
    Key? key,
    required this.count,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}