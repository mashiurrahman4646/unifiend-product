import 'package:flutter/material.dart';

class ResponsiveHelper {
  final BuildContext context;
  final BoxConstraints constraints;

  ResponsiveHelper(this.context, this.constraints);

  double get screenWidth => constraints.maxWidth;
  double get screenHeight => constraints.maxHeight;

  bool get isTablet => screenWidth > 600;

  double get horizontalPadding => isTablet ? 40.0 : screenWidth * 0.05;

  double adaptiveSize(double mobile, double tablet) {
    return isTablet ? tablet : mobile;
  }

  double get titleFontSize => adaptiveSize(26.0, 32.0);
  double get subtitleFontSize => 14.0;
  double get bodyFontSize => adaptiveSize(14.0, 16.0);
  double get buttonHeight => adaptiveSize(50.0, 60.0);
  
  int get gridCrossAxisCount => isTablet ? 3 : 2;
  double get gridChildAspectRatio => adaptiveSize(0.6, 0.7);
}
