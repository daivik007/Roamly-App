import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color _bgColor = Color(0xFF0E1514);
  static const Color _primaryColor = Color(0xFF006A66);
  static const Color _secondaryContainerColor = Color(0xFFCCE8E5);
  static const Color _activeNavBg = Color(0x801295902);

  // Asset URLs from Figma (valid for 7 days)
  static const String _avatarUrl =
      'https://www.figma.com/api/mcp/asset/f5c01322-7e1f-497a-a511-06eddb0df847';
  static const String _timelineIconUrl =
      'https://www.figma.com/api/mcp/asset/f6c9560d-f3fd-4cb9-b61d-c29c769fea0a';
  static const String _connectIconUrl =
      'https://www.figma.com/api/mcp/asset/9e746910-e825-45ee-9c52-9bce5421156d';
  static const String _personAddIconUrl =
      'https://www.figma.com/api/mcp/asset/392924b1-4ce4-43ec-a88e-1412cbcff355';
  static const String _pollIconUrl =
      'https://www.figma.com/api/mcp/asset/ab0489bb-816e-49fb-9f9b-0db03bc356fd';
  static const String _settingsIconUrl =
      'https://www.figma.com/api/mcp/asset/ab0489bb-816e-49fb-9f9b-0db03bc356fd';
  static const String _helpIconUrl =
      'https://www.figma.com/api/mcp/asset/ab0489bb-816e-49fb-9f9b-0db03bc356fd';
  static const String _homeIconUrl =
      'https://www.figma.com/api/mcp/asset/5492f7e5-b4f0-49b1-aaf7-45764afba31c';
  static const String _heartIconUrl =
      'https://www.figma.com/api/mcp/asset/3e64fa11-0e47-419c-a27e-dd2952f00884';
  static const String _userIconUrl =
      'https://www.figma.com/api/mcp/asset/56783adb-38ec-4ffd-9572-57c37443f11b';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Profile card
                  _buildProfileCard(),
                  const SizedBox(height: 32),
                  // Menu items
                  _buildMenuItem(_timelineIconUrl, 'Your Timeline'),
                  _buildMenuItem(_connectIconUrl, 'Location sharing'),
                  _buildMenuItem(_personAddIconUrl, 'Invite your friends'),
                  _buildMenuItem(_pollIconUrl, 'Your Data'),
                  _buildMenuItem(_settingsIconUrl, 'Settings'),
                  _buildMenuItem(_helpIconUrl, 'Help and Support'),
                  // Bottom nav padding
                  const SizedBox(height: 100),
                ],
              ),
            ),
            // Bottom nav bar
            Positioned(
              left: 20,
              right: 20,
              bottom: 16,
              child: _buildNavBar(activeIndex: 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Container(
        height: 141,
        decoration: BoxDecoration(
          color: _primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(width: 21),
            // Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFD9D9D9),
                image: DecorationImage(
                  image: NetworkImage(_avatarUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 25),
            // Name + email
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sophie Gemini',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'gemini@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: _secondaryContainerColor,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String iconUrl, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 18),
      child: Row(
        children: [
          Image.network(
            iconUrl,
            width: 40,
            height: 40,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.circle_outlined,
              color: _secondaryContainerColor,
              size: 40,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: _secondaryContainerColor,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar({required int activeIndex}) {
    return Container(
      height: 59,
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Home
          _buildNavItem(
            iconUrl: _homeIconUrl,
            fallbackIcon: Icons.home_outlined,
            label: null,
            isActive: activeIndex == 0,
          ),
          // Saved (heart)
          _buildNavItem(
            iconUrl: _heartIconUrl,
            fallbackIcon: Icons.favorite_border,
            label: null,
            isActive: activeIndex == 1,
          ),
          // Profile
          _buildNavItem(
            iconUrl: _userIconUrl,
            fallbackIcon: Icons.person_outline,
            label: 'Profile',
            isActive: activeIndex == 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconUrl,
    required IconData fallbackIcon,
    String? label,
    required bool isActive,
  }) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
              color: const Color(0x801295902),
              border: const Border(
                top: BorderSide(color: Colors.white, width: 2),
              ),
            )
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            iconUrl,
            width: 24,
            height: 24,
            color: Colors.white,
            colorBlendMode: BlendMode.srcIn,
            errorBuilder: (_, __, ___) => Icon(
              fallbackIcon,
              color: Colors.white,
              size: 24,
            ),
          ),
          if (label != null) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}