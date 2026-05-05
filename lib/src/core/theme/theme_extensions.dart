import 'package:flutter/material.dart';

/// Custom theme extension for components not covered by Material
class CustomComponentsTheme extends ThemeExtension<CustomComponentsTheme> {
  final StatusBadgeStyle statusBadgeStyle;

  CustomComponentsTheme({required this.statusBadgeStyle});

  @override
  ThemeExtension<CustomComponentsTheme> copyWith({
    StatusBadgeStyle? statusBadgeStyle,
  }) {
    return CustomComponentsTheme(
      statusBadgeStyle: statusBadgeStyle ?? this.statusBadgeStyle,
    );
  }

  @override
  ThemeExtension<CustomComponentsTheme> lerp(
    ThemeExtension<CustomComponentsTheme>? other,
    double t,
  ) {
    if (other is! CustomComponentsTheme) {
      return this;
    }

    return CustomComponentsTheme(
      statusBadgeStyle: StatusBadgeStyle.lerp(
        statusBadgeStyle,
        other.statusBadgeStyle,
        t,
      ),
    );
  }
}

/// Style for status badges
class StatusBadgeStyle {
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle textStyle;

  const StatusBadgeStyle({
    required this.borderRadius,
    required this.padding,
    required this.textStyle,
  });

  static StatusBadgeStyle lerp(
    StatusBadgeStyle a,
    StatusBadgeStyle b,
    double t,
  ) {
    return StatusBadgeStyle(
      borderRadius: lerpDouble(a.borderRadius, b.borderRadius, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t)!,
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t)!,
    );
  }
}

/// Helper method for lerping doubles
double lerpDouble(double a, double b, double t) {
  return a + (b - a) * t;
}
