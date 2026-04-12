import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Logo / big title
  static final logoTitle = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );

  // Section headers like "Picks for you"
  static final sectionHeader = GoogleFonts.poppins(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  // Place name on cards
  static final placeName = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  // Price
  static final price = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  // Tagline
  static final tagline = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  // Search bar main text
  static final searchHint = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.onTertiaryContainer,
  );

  // Small labels (filter chips, sub-info)
  static final smallLabel = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  // Small grey sub-label
  static final subLabel = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  // Bottom nav label
  static final navLabel = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12,
    color: AppColors.white,
  );

  // Location text
  static final locationText = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryFixed,
    letterSpacing: 0.1,
  );
}