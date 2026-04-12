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
      'label': 'CAFE',
      'image': 'https://www.figma.com/api/mcp/asset/b2264041-8f3d-44fc-9f6d-e00ef0bf7ad9',
    },
    {
      'label': 'OUTDOOR',
      'image': 'https://www.figma.com/api/mcp/asset/62fcc623-c3c6-41cf-96bd-6a05bc2c6ad0',
    },
    {
      'label': 'CLUB',
      'image': 'https://www.figma.com/api/mcp/asset/72b57b03-5c08-4528-b023-95fd92906467',
    },
    {
      'label': 'MUSEUM',
      'image': 'https://www.figma.com/api/mcp/asset/53d756c7-b3e4-4bb8-bb58-1a8302829a6d',
    },
    {
      'label': 'MARKETS',
      'image': 'https://www.figma.com/api/mcp/asset/81a555ae-260c-4cfb-933b-e77b5727a60d',
    },
    {
      'label': 'CULTURE',
      'image': 'https://www.figma.com/api/mcp/asset/c07159dc-5a28-4cb6-95c9-0c4f4c70784c',
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
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),

            // Dark overlay
            Container(
              color: isSelected
                  ? Colors.black.withOpacity(0.2)
                  : Colors.black.withOpacity(0.5),
            ),

            // Selected teal border
            if (isSelected)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFF9CF1EC),
                    width: 3,
                  ),
                ),
              ),

            // Label
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