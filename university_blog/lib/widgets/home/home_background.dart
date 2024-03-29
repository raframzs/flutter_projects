import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/theme/app_theme.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final IconData firstIcon;
  const HomeBackground(
      {super.key,
      required this.child,
      required this.firstIcon,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(alignment: Alignment.center, children: [
        _IconsBackground(
          firstIcon: firstIcon,
          isLoading: isLoading,
        ),
        child
      ]),
    );
  }
}

class _IconsBackground extends StatefulWidget {
  final bool isLoading;
  final IconData firstIcon;
  const _IconsBackground({required this.firstIcon, required this.isLoading});

  @override
  State<_IconsBackground> createState() => _IconsBackgroundState();
}

class _IconsBackgroundState extends State<_IconsBackground> {
  @override
  Widget build(BuildContext context) {
    AppTheme themeProvider = Provider.of<AppTheme>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: themeProvider.background)),
      child: Stack(children: [
        _IconBackground(
            icon: widget.firstIcon,
            color: themeProvider.iconsColor,
            left: 30,
            top: 90,
            rotation: -15),
        _IconBackground(
            icon: Icons.edit,
            color: themeProvider.iconsColor,
            left: 300,
            top: 20,
            rotation: 20),
        _IconBackground(
            icon: Icons.account_box_outlined,
            color: themeProvider.iconsColor,
            left: 180,
            top: 190,
            rotation: 20),
        _IconBackground(
            icon: Icons.whatshot_rounded,
            color: themeProvider.iconsColor,
            left: 5,
            top: 290,
            rotation: 20),
        _IconBackground(
            icon: Icons.data_object_outlined,
            color: themeProvider.iconsColor,
            left: 340,
            top: 250,
            rotation: -30),
        _IconBackground(
            icon: Icons.edgesensor_low_outlined,
            color: themeProvider.iconsColor,
            left: 240,
            top: 400,
            rotation: 20),
        _IconBackground(
            icon: Icons.face_3_outlined,
            color: themeProvider.iconsColor,
            left: 30,
            top: 500,
            rotation: 0),
        _IconBackground(
            icon: Icons.face_6_outlined,
            color: themeProvider.iconsColor,
            left: 300,
            top: 600,
            rotation: 20),
        _IconBackground(
            icon: Icons.games_outlined,
            color: themeProvider.iconsColor,
            left: 140,
            top: 650,
            rotation: 20),
      ]),
    );
  }
}

class _IconBackground extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int rotation;
  final double top;
  final double left;
  const _IconBackground({
    required this.icon,
    required this.color,
    required this.rotation,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: rotation * pi / 180,
        child: Icon(
          icon,
          size: 100,
          shadows: const [
            Shadow(color: Color.fromARGB(136, 0, 0, 0), blurRadius: 10)
          ],
          color: color,
        ),
      ),
    );
  }
}
