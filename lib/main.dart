import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

// Reusable Components
class TikTokAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? trailing;

  const TikTokAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: trailing != null ? [trailing!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? backgroundColor;
  final Color? textColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.enabled = true,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFFFF2B5C),
          disabledBackgroundColor: const Color(0xFFE1E1E1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;

  const SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: iconColor ?? Colors.black87,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            trailing ??
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 20,
                ),
          ],
        ),
      ),
    );
  }
}

// Screen 1: Profile Screen (Starting point - simplified version of what we see)
class ProfileScreen extends StatelessWidget {
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
                  const Row(
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
                          builder: (context) => const SettingsScreen(),
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
                          builder: (context) => const ManageAccountScreen(),
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
                          builder: (context) => const BusinessIntroScreen(),
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
                    builder: (context) => const CategorySelectionScreen(),
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

// Screen 5: Category Selection
class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  State<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  String? selectedCategory;

  final List<String> categories = [
    "Art & Crafts",
    "Automotive & Transportation", 
    "Baby",
    "Beauty",
    "Clothing & Accessories",
    "Education & Training",
    "Electronics",
    "Finance & Investing",
    "Food & Beverage",
    "Media & Entertainment",
    "Personal Blog",
    "Pets",
    "Professional Services",
    "Public Administration",
    "Real Estate",
    "Restaurants & Bars",
    "Shopping & Retail",
    "Software & Apps",
    "Sports, Fitness & Outdoors",
    "Travel & Tourism",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TikTokAppBar(title: ""),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Text(
              "Choose a category",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "Select the category that best describes your account. This category won't be displayed publicly.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ),
          
          // Category list
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;
                
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFFFF2B5C) : const Color(0xFFE1E1E1),
                              width: 2,
                            ),
                            color: isSelected ? const Color(0xFFFF2B5C) : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Bottom section with Next button
          Container(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(
              text: "Next",
              enabled: selectedCategory != null,
              onPressed: selectedCategory != null ? () {
                // TODO: Save selected category and proceed to next step
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessSuccessScreen(selectedCategory: selectedCategory!),
                  ),
                );
              } : null,
            ),
          ),
        ],
      ),
    );
  }
}

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

