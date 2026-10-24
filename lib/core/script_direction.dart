import 'package:flutter/material.dart';

/// Keeps a medication name in the direction of its own script when the
/// interface is Arabic and the name is Latin, or the reverse.
TextDirection directionForText(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return TextDirection.ltr;
  }
  for (final rune in trimmed.runes) {
    if (_isRtl(rune)) {
      return TextDirection.rtl;
    }
    if (_isLtr(rune)) {
      return TextDirection.ltr;
    }
  }
  return TextDirection.ltr;
}

bool _isRtl(int rune) {
  return (rune >= 0x0590 && rune <= 0x08FF) ||
      (rune >= 0xFB1D && rune <= 0xFDFF) ||
      (rune >= 0xFE70 && rune <= 0xFEFF);
}

bool _isLtr(int rune) {
  return (rune >= 0x0041 && rune <= 0x005A) ||
      (rune >= 0x0061 && rune <= 0x007A) ||
      (rune >= 0x00C0 && rune <= 0x024F);
}
