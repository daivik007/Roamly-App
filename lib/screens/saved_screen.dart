import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  static const Color _bgColor = Color(0xFF0E1514);
  static const Color _primaryColor = Color(0xFF006A66);

  // Image URLs from Figma (valid for 7 days)
  static const List<_SavedPlace> _places = [
    _SavedPlace(
      name: 'Eiffel Tower',
      location: 'Paris',
      imageUrl:
          'https://www.figma.com/api/mcp/asset/dc6327f2-aa74-48b5-ae34-8d2adeb1984f',
    ),
    _SavedPlace(
      name: 'Tokyo Tower',
      location: 'Tokyo',
      imageUrl:
          'https://www.figma.com/api/mcp/asset/8cc34bbc-d786-450f-a7a0-c3022a47d104',
    ),
    _SavedPlace(
      name: 'Angkor Wat',
      location: 'Cambodia',
      imageUrl:
          'https://www.figma.com/api/mcp/asset/ab880d0f-8667-4b89-a36c-fe14027b44d4',
    ),
    _SavedPlace(
      name: 'Negoyama zoo',
      location: 'Yokohama',
      imageUrl:
          'https://www.figma.com/api/mcp/asset/3b113ecd-8061-461a-9c15-d9ce16b87dbc',
    ),
    _SavedPlace(
      name: 'Thar desert',
      location: 'Rajasthan',
      imageUrl:
          'https://www.figma.com/api/mcp/asset/6bc1ca71-4c46-47ce-9f2c-aac42b5fb3a9',
    ),
    _SavedPlace(
      name: 'Wat Arun',
      location: 'Bangkok',
      imageUrl:
          'https://www.figma.com/api/mcp/asset/d6eea36c-98a1-4134-8b07-4804ec1d3f4d',
    ),
  ];

  static const String _homeIconUrl =
      'https://www.figma.com/api/mcp/asset/5948a8b5-fba2-4133-afaa-56019de1e44d';
  static const String _heartIconUrl =
      'https://www.figma.com/api/mcp/asset/3fc4b58f-9e57-4c8e-b002-fe39f38edf55';
  static const String _userIconUrl =
      'https://www.figma.com/api/mcp/asset/a632a2da-a898-4e61-99c6-01683f5369b0';

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
                  const SizedBox(height: 32),
                  // Title
                  const Text(
                    'Saved',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _places.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 161 / 140,
                      ),
                      itemBuilder: (context, index) {
                        return _buildSavedCard(_places[index]);
                      },
                    ),
                  ),
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
              child: _buildNavBar(activeIndex: 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedCard(_SavedPlace place) {
    return Container(
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(17),
                image: DecorationImage(
                  image: NetworkImage(place.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(11, 11, 11, 0),
            ),
          ),
          // Name + location
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 6, 11, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white,
                    letterSpacing: 0.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  place.location,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.white,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
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
          _buildNavItem(
            iconUrl: _homeIconUrl,
            fallbackIcon: Icons.home_outlined,
            label: null,
            isActive: activeIndex == 0,
          ),
          _buildNavItem(
            iconUrl: _heartIconUrl,
            fallbackIcon: Icons.favorite_border,
            label: 'Saved',
            isActive: activeIndex == 1,
          ),
          _buildNavItem(
            iconUrl: _userIconUrl,
            fallbackIcon: Icons.person_outline,
            label: null,
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
          ? const BoxDecoration(
              color: Color(0x80129590),
              border: Border(
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

class _SavedPlace {
  final String name;
  final String location;
  final String imageUrl;

  const _SavedPlace({
    required this.name,
    required this.location,
    required this.imageUrl,
  });
}

// TODO: Fix saved screen as per figma