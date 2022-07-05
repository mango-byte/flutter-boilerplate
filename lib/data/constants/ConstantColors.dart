import 'package:flutter/material.dart';

mixin ConstantColors {
  static LinearGradient gradientPrimary = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF142D7D),
        Color(0xFF01c755)
      ]
  );
  static Color primary =        const Color(0xFF7092C1);
  static Color primaryButton =  const Color(0xFF4663ac);
  static Color green =          const Color(0xFF00C402);
  static Color greyButton =     const Color(0xFFDCDCDC);
  static Color secondary =      const Color(0xFF31C782);
  static Color shadowColor =    const Color(0x33000000);
  static Color white =          const Color(0xFFFFFFFF);

  static const kBlueColor = Color(0xFF3C82FF);
  static const kBlackColor = Color(0xFF000000);
  static const kwhiteColor = Color(0xFFFFFFFF);
  static const kDarkblack = Color(0xFF8B959A);
}
