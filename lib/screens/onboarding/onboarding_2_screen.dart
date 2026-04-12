import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../home/home_screen.dart';

class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({super.key});

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen> {
  String? _selected;

  final List<Map<String, String>> _modes = [
    {
      'label': 'Walk',
      'image': 'assets/onb2/walk.jpg',
    },
    {
      'label': 'Nearby',
      'image': 'assets/onb2/nearby.jpg',
    },
    {
      'label': 'Drive',
      'image': 'assets/onb2/drive.jpg',
    },
    {
      'label': 'Train',
      'image': 'assets/onb2/train.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 110),

              // Title
              Text(
                'How far are you willing to travel?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFCCE8E5),
                ),
              ),

              const SizedBox(height: 50),

              // 2x2 grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _modes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final mode = _modes[index];
                  final isSelected = _selected == mode['label'];
                  return _TravelTile(
                    label: mode['label']!,
                    imageUrl: mode['image']!,
                    isSelected: isSelected,
                    onTap: () => setState(() => _selected = mode['label']),
                  );
                },
              ),

              const Spacer(),

              // Next button
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
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

class _TravelTile extends StatelessWidget {
  final String label;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const _TravelTile({
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
            Image.asset(imageUrl, fit: BoxFit.cover),

            Container(
              color: isSelected
                  ? Colors.black.withOpacity(0.2)
                  : Colors.black.withOpacity(0.5),
            ),

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
                    width: 3,
                  ),
                ),
              ),

              if (isSelected)
              const Center(
                child: Icon(Icons.check,
                color: Colors.black,
                size: 45)
              ),


            if (!isSelected)
            Center(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
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