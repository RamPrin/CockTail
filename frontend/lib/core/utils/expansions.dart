import 'package:flutter/material.dart';

const double _mobileMaxRatio = 12 / 9;
const double _maxMobileWidth = 700;

extension MyExtension on BuildContext {
  bool get isMobile =>
      MediaQuery.of(this).size.height / MediaQuery.of(this).size.width >=
          _mobileMaxRatio ||
      MediaQuery.of(this).size.width <= _maxMobileWidth;
}
