import 'package:flutter/material.dart';

Color changeOpacity(double percentage) {
  int alphaValue = (255 * percentage).round();
  return const Color.fromARGB(255, 30, 253, 0).withAlpha(alphaValue);
}
