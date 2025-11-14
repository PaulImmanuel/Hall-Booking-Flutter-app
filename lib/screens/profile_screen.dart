// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../main.dart'; // To get kPrimaryColor
import 'login_screen.dart'; // To navigate back on sign out

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // --- Profile Header ---
            _buildProfileHeader(),
            const SizedBox(height: 24),

            // --- Wallet Card ---
            _buildWalletCard(),
            const SizedBox(height: 24),

            // --- Menu List (CORRECTED) ---
            _buildMenuList(context),
            const SizedBox(height: 20),

            // --- Sign Out Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to Login and remove all other screens
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700], // Red for sign out
                  foregroundColor: Colors.white,
                ),
                child: const Text("Sign Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header Widget
  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade200,
          backgroundImage:
              const AssetImage('assets/images/profile_pic.jpeg'),
        ),
        const SizedBox(height: 12),
        const Text(
          "Paul", // Hardcoded name
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "paul@gmail.com", // Hardcoded email
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // Wallet Card Widget
  Widget _buildWalletCard() {
    return Card(
      elevation: 4,
      shadowColor: kPrimaryColor.withOpacity(0.1),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryColor, kPrimaryColor.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Available Balance",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "₹ 5,000", // Hardcoded balance
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Menu List Widget (CORRECTED) ---
  // All ListTiles are now inside one Card
  Widget _buildMenuList(BuildContext context) {
    return Card(
      child: Column(
        children: [
// ... inside _buildMenuList
_buildMenuListItem(
  icon: Icons.person_outline,
  title: "Edit Profile",
  onTap: () {},
),
const Divider(height: 1, indent: 58, endIndent: 16), // <-- NEW
_buildMenuListItem(
  icon: Icons.bookmark_border,
  title: "My Bookmarks",
  onTap: () {},
),
const Divider(height: 1, indent: 58, endIndent: 16), // <-- NEW
_buildMenuListItem(
  icon: Icons.calendar_today_outlined,
  title: "My Bookings",
  onTap: () {},
),
const Divider(height: 1, indent: 58, endIndent: 16), // <-- NEW
_buildMenuListItem(
  icon: Icons.settings_outlined,
  title: "Settings",
  onTap: () {},
),
const Divider(height: 1, indent: 58, endIndent: 16), // <-- NEW
_buildMenuListItem(
  icon: Icons.help_outline,
  title: "Help & Support",
  onTap: () {},
),
const Divider(height: 1, indent: 58, endIndent: 16), // <-- NEW
_buildMenuListItem(
  icon: Icons.article_outlined,
  title: "Terms & Conditions",
  onTap: () {},
),
const Divider(height: 1, indent: 58, endIndent: 16), // <-- NEW
_buildMenuListItem(
  icon: Icons.privacy_tip_outlined,
  title: "Privacy Policy",
  onTap: () {},
  hideArrow: true,
),
        ],
      ),
    );
  }

  // A helper for each menu item (This is a ListTile, NOT a Card)
  Widget _buildMenuListItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool hideArrow = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: kPrimaryColor),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: hideArrow
          ? null
          : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}