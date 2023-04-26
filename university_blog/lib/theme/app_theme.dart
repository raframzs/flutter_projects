import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  static const primary = Color(0xffe2001a);
  bool isDarkMode = false;

  //LogginScreen
  Color scaffoldBackground = Colors.grey.shade300;

  // HomeBackGround vars
  Color iconsColor = primary;
  List<Color> background = [
    const Color.fromARGB(255, 234, 231, 231),
    Colors.grey
  ];

  //BlogAppBar
  List<Color> appBarBackground = [
    const Color.fromARGB(255, 225, 40, 62),
    primary
  ];
  Color appBarLogoColor = Colors.black;
  Color appBarLogoIcon = Colors.white;
  Color appBarMenu = Colors.white;
  Color appBarMenuIcon = primary;
  Color appBarMenuText = Colors.black;

  //BlogCard
  Color emailLogoColor = primary;

  //BlogFloatingActionButton
  Color buttonColor = primary;
  Color switchThemeButton = Colors.black;

  //CreateBlog
  Color gnrlColor = primary;
  Color createIconColor = Colors.white;

  //Loading
  Color loading = primary;

  ThemeData currentTheme = lightTheme();

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
        primaryColor: primary,
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
        ));
  }

  swtichTheme() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      iconsColor = const Color.fromARGB(162, 255, 214, 64);
      background = const [
        Color.fromARGB(255, 64, 64, 64),
        Color.fromARGB(255, 0, 0, 0)
      ];
      appBarBackground = [const Color.fromARGB(255, 55, 55, 55), Colors.black];
      appBarLogoColor = Colors.amberAccent;
      appBarLogoIcon = Colors.amberAccent;
      buttonColor = Colors.black;
      emailLogoColor = Colors.black;
      switchThemeButton = Colors.amberAccent;
      createIconColor = Colors.amberAccent;
      appBarMenuIcon = Colors.amberAccent;
      gnrlColor = Colors.black;
      appBarMenu = const Color.fromARGB(255, 54, 54, 54);
      appBarMenuText = Colors.white;
      loading = Colors.amberAccent;
      scaffoldBackground = const Color.fromARGB(255, 79, 79, 79);
    } else {
      iconsColor = AppTheme.primary;
      background = [const Color.fromARGB(255, 234, 231, 231), Colors.grey];
      appBarBackground = [const Color.fromARGB(255, 225, 40, 62), primary];
      appBarLogoColor = Colors.black;
      appBarLogoIcon = Colors.white;
      buttonColor = primary;
      emailLogoColor = primary;
      switchThemeButton = Colors.black;
      gnrlColor = primary;
      createIconColor = Colors.white;
      appBarMenu = Colors.white;
      appBarMenuIcon = primary;
      appBarMenuText = Colors.black;
      loading = primary;
      scaffoldBackground = Colors.grey.shade300;
    }
    notifyListeners();
  }
}
