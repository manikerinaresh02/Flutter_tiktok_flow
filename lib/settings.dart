import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_flow/manageaccount.dart';
import 'package:tiktok_flow/resuable_components.dart';

// Screen 2: Settings and Privacy
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TikTokAppBar(title: "Settings and privacy"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Section
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Text(
                "ACCOUNT",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SettingsItem(
                    icon: Icons.person_outline,
                    title: "Manage account",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageAccountScreen(),
                        ),
                      );
                    },
                  ),
                  SettingsItem(
                    icon: Icons.lock_outline,
                    title: "Privacy",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.security_outlined,
                    title: "Security and login",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: "Balance",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.qr_code_outlined,
                    title: "QR code",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.share_outlined,
                    title: "Share profile",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            
            // Content & Activity Section
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 8),
              child: Text(
                "CONTENT & ACTIVITY",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SettingsItem(
                    icon: Icons.notifications_outlined,
                    title: "Push notifications",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.live_tv_outlined,
                    title: "LIVE Events",
                    onTap: () {},
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
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
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                      ],
                    ),
                  ),
                  SettingsItem(
                    icon: Icons.language_outlined,
                    title: "App language",
                    subtitle: "English",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.dark_mode_outlined,
                    title: "Dark mode",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.video_camera_back_outlined,
                    title: "Content preferences",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.campaign_outlined,
                    title: "Ads",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }
}