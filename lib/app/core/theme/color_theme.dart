
import 'package:flutter/material.dart';
import 'package:godevi/app/core/theme/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixins/mixins.dart';

bool isDarkTheme = true;

class AppThemeColor {
  static final primary = isDarkTheme ? Colors.white : Colors.black54;
  static final secondary = isDarkTheme ? Colors.white54 : Colors.black38;
  static final third = isDarkTheme ? Colors.white38 : Colors.black26;

  // background
  static final background = isDarkTheme ? Mixins.hex('36404a') : Colors.white;
  static final background1 = isDarkTheme ? Mixins.hex('303841') : Mixins.hex('f5f5f5') ;
  static final background2 = isDarkTheme ? Mixins.hex('36404a') : Colors.white;

  // font

  static final primaryFont = gfont.copyWith(color: isDarkTheme ? Colors.white : Colors.black54);
  static final secondaryFont = gfont.copyWith(color: isDarkTheme ? Colors.white54 : Colors.black45);

  // border
  static final border1 = isDarkTheme ? Colors.white.withOpacity(.9) : Colors.black.withOpacity(.9);
  static final border2 = isDarkTheme ? Colors.white.withOpacity(.2) : Colors.black.withOpacity(.1);

  static active(bool value) => isDarkTheme ? (value ? Colors.white : Colors.white38) : (value ? Colors.black54 : Colors.black38);
}