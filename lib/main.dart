import 'package:flutter/material.dart';
import 'package:tiktok_flow/profilescreen.dart';

void main() {
  runApp(const TikTokBusinessApp());
}

class TikTokBusinessApp extends StatelessWidget {
  const TikTokBusinessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Business Flow',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SF Pro Text', // iOS system font, fallback to default
      ),
      home: const ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

