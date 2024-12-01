import 'package:flutter/material.dart';

///[MediaQueryExtension] extension  on [BuildContext] to get info about width and height of [context]
extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  ScaffoldMessengerState get scaffoldMessage => ScaffoldMessenger.of(this);
  ThemeData get theme => Theme.of(this);
}
