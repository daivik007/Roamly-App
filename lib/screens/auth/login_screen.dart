import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../onboarding/onboarding_1_screen.dart';
import '../../theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/illus/girl_run.svg',
                  height: 225,
                  width: 225,
                ),

                const SizedBox(height: 32),

                // App name
                Text(
                  'Roamly',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                  ),
                ),

                const SizedBox(height: 8),

                // Tagline
                Text(
                  'Discover. Explore. Experience.',
                  style: GoogleFonts.poppins(
                    fontSize:20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 80),

                // Google Sign-In Button
                SizedBox(
                  width: 250,
                  height: 57,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.googleButtonText,
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Onboarding1Screen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Google.svg',
                          width:25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Continue with Google',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.googleButtonText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
