import 'package:flutter/cupertino.dart';

class AppTheme {
  static final lightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.activeBlue,
    scaffoldBackgroundColor: CupertinoColors.systemBackground,
    textTheme: const CupertinoTextThemeData(
      textStyle: TextStyle(color: CupertinoColors.black),
    ),
  );

  static final darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.activeBlue,
    scaffoldBackgroundColor: CupertinoColors.black,
    textTheme: const CupertinoTextThemeData(
      textStyle: TextStyle(color: CupertinoColors.white),
    ),
  );
}
