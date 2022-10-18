
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:godevi/app/core/theme/color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle gfont = GoogleFonts.nunitoSans(fontSize: 15.5, color: AppThemeColor.primary);

class Gfont {
  // size
  static final fs13 = gfont.copyWith(fontSize: 13);
  static final fs14 = gfont.copyWith(fontSize: 14);
  static final fs15 = gfont.copyWith(fontSize: 15);
  static final fs16 = gfont.copyWith(fontSize: 16);
  static final fs17 = gfont.copyWith(fontSize: 17);
  static final fs18 = gfont.copyWith(fontSize: 18);
  static final fs19 = gfont.copyWith(fontSize: 19);
  static final fs20 = gfont.copyWith(fontSize: 20);
  static fs(dynamic size) => gfont.copyWith(fontSize: size);

  // color
  static color(Color color) => gfont.copyWith(color: color);

  static final bold = gfont.copyWith(fontWeight: FontWeight.bold, color: AppThemeColor.primary);
  static boldWith([Color color = Colors.black54, double size = 15.5]) => gfont.copyWith(fontWeight: FontWeight.bold, color: color, fontSize: size);
}