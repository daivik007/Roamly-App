import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../onboarding/onboarding_2_screen.dart';

class Onboarding1Screen extends StatefulWidget {
  const Onboarding1Screen({super.key});

  @override
  State<Onboarding1Screen> createState() => _Onboarding1ScreenState();
}

class _Onboarding1ScreenState extends State<Onboarding1Screen> {
  final List<String> _selected = [];

  final List<Map<String, String>> _categories = [
    {
      'label': 'Cafe',
      'image': 'assets/onb1/cafe.png',
    },
    {
      'label': 'Outdoor',
      'image': 'assets/onb1/outdoor.jpg',
    },
    {
      'label': 'Club',
      'image': 'assets/onb1/club.jpg',
    },
    {
      'label': 'Museum',
      'image': 'assets/onb1/museum.jpg',
    },
    {
      'label': 'Markets',
      'image': 'assets/onb1/markets.jpg',
    },
    {
      'label': 'Culture',
      'image': 'assets/onb1/culture.jpg',
    },
  ];

  void _toggleSelection(String label) {
    setState(() {
      if (_selected.contains(label)) {
        _selected.remove(label);
      } else {
        _selected.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),

              // Title
              Text(
                'Welcome aboard!',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFDDE4E2),
                ),
              ),

              const SizedBox(height: 20),

              // Subtitle
              Text(
                'What type of places do you love exploring?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFCCE8E5),
                ),
              ),

              const SizedBox(height: 40),

              // 2-column grid of category tiles
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 154 / 123,
                  ),
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    final isSelected = _selected.contains(cat['label']);
                    return _CategoryTile(
                      label: cat['label']!,
                      imageUrl: cat['image']!,
                      isSelected: isSelected,
                      onTap: () => _toggleSelection(cat['label']!),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Next button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Onboarding2Screen(),
                    ),
                  );
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9CF1EC),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String label;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryTile({
    required this.label,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),

            // Dark overlay
            Container(
              color: isSelected
                  ? Colors.black.withOpacity(0.2)
                  : Colors.black.withOpacity(0.5),
            ),

            // Teal overlay animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              color: isSelected ? const Color(0xFF9CF1EC).withOpacity(0.35) : Colors.transparent,
            ),

            if (isSelected)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFF9CF1EC),
                  width: 3
                )
              )
            ),

              // Checkmark icon
              if (isSelected)
              const Center(
                child: Icon(Icons.check,
                color: Colors.black,
                size: 45)
              ),

            // Label
            if (!isSelected)
            Center(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}