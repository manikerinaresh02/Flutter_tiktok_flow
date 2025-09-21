import 'package:flutter/material.dart';
import 'package:tiktok_flow/businessintro.dart';
import 'package:tiktok_flow/resuable_components.dart';


// Screen 3: Manage Account
class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TikTokAppBar(title: "Manage account"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Information Section
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Text(
                "Account information",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SettingsItem(
                    icon: Icons.phone_outlined,
                    title: "Phone number",
                    subtitle: "+65•••••988",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.email_outlined,
                    title: "Email",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.cake_outlined,
                    title: "Date of birth",
                    subtitle: "18 Feb 1995",
                    onTap: () {},
                  ),
                  SettingsItem(
                    icon: Icons.lock_outline,
                    title: "Password",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Account Control Section
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 8),
              child: Text(
                "Account control",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SettingsItem(
                    icon: Icons.business_outlined,
                    title: "Switch to Business Account",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusinessIntroScreen(),
                        ),
                      );
                    },
                  ),
                  SettingsItem(
                    icon: Icons.delete_outline,
                    title: "Delete account",
                    iconColor: Colors.red,
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