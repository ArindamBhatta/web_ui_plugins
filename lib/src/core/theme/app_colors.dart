import 'package:flutter/material.dart';

/// Application color palette
///
/// Defines all colors used throughout the application for consistent theming.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ── Primary Colors ────────────────────────────────────────────────────────
  /// Primary brand color - Light theme
  static const Color primaryLight = Color(0xFFE0A899);

  /// Primary brand color - Dark theme
  static const Color primaryDark = Color(0xFFA3D8E8);

  /// Primary brand color - General use
  static const Color primary = Color(0xFF3B5998);

  /// Custom build color - Alternative primary
  static const Color customBuildColor = Color(0xFFE0A899);

  // ── Secondary Colors ──────────────────────────────────────────────────────
  /// Secondary brand color - Light theme
  static const Color secondaryLight = Color(0xFFB8956A);

  /// Secondary brand color - Dark theme
  static const Color secondaryDark = Color(0xFF8ECAE6);

  /// Secondary brand color - General use
  static const Color secondary = Color(0xFF8ECAE6);

  // ── Background Colors ────────────────────────────────────────────────────
  /// Card background color - Light theme
  static const Color cardBackground = Color(0xFFFFF8F5);

  /// Background color - Light theme
  static const Color background = Color(0xFFFFFBF9);

  /// Background color - Dark theme
  static const Color darkBackground = Color(0xFF121212);

  // ── Text Colors ──────────────────────────────────────────────────────────
  /// Primary text color - Light theme
  static const Color textPrimary = Color(0xFF1A1A1A);

  /// Secondary text color - Light theme
  static const Color textSecondary = Color(0xFF666666);

  /// Light text color for subtle content
  static const Color textLight = Color(0xFF999999);

  /// Text color on primary - Light theme
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  /// Text color on dark backgrounds
  static const Color textOnDark = Color(0xFFBBBBBB);

  // ── Semantic Colors ──────────────────────────────────────────────────────
  /// Error color for validation and alerts
  static const Color errorColor = Color(0xFFD32F2F);

  /// Border color - Light theme
  static const Color borderColor = Color(0xFFE0E0E0);

  /// Divider color
  static const Color dividerColor = Color(0xFFEEEEEE);

  /// Disabled state color
  static const Color disabledBackground = Color(0xFFF5F5F5);

  /// Shadow color
  static const Color shadowColor = Color(0x1A000000);

  // ── Accent Colors ────────────────────────────────────────────────────────
  /// Cyan/Turquoise accent color
  static const Color accentCyan = Color(0xFF00E5FF);

  /// Success color for positive states
  static const Color successColor = Color(0xFF4CAF50);

  /// Warning color for alerts
  static const Color warningColor = Color(0xFFFFC107);

  /// Info color for informational messages
  static const Color infoColor = Color(0xFF2196F3);
}
