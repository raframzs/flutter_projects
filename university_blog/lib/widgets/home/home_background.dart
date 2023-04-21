import 'dart:math';

import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;
  final Color iconsColor;
  const HomeBackground(
      {super.key, required this.child, required this.iconsColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(alignment: Alignment.center, children: [
        _IconsBackground(
          iconColor: iconsColor,
        ),
        child
      ]),
    );
  }
}

class _IconsBackground extends StatelessWidget {
  final Color iconColor;
  const _IconsBackground({required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _redBackground(),
      child: Stack(children: [
        _IconBackground(
            icon: Icons.chat,
            color: iconColor,
            left: 30,
            top: 90,
            rotation: -15),
        _IconBackground(
            icon: Icons.edit,
            color: iconColor,
            left: 300,
            top: 20,
            rotation: 20),
        _IconBackground(
            icon: Icons.account_box_outlined,
            color: iconColor,
            left: 180,
            top: 190,
            rotation: 20),
        _IconBackground(
            icon: Icons.whatshot_rounded,
            color: iconColor,
            left: 5,
            top: 290,
            rotation: 20),
        _IconBackground(
            icon: Icons.data_object_outlined,
            color: iconColor,
            left: 340,
            top: 250,
            rotation: -30),
        _IconBackground(
            icon: Icons.edgesensor_low_outlined,
            color: iconColor,
            left: 240,
            top: 400,
            rotation: 20),
        _IconBackground(
            icon: Icons.face_3_outlined,
            color: iconColor,
            left: 30,
            top: 500,
            rotation: 0),
        _IconBackground(
            icon: Icons.face_6_outlined,
            color: iconColor,
            left: 300,
            top: 600,
            rotation: 20),
        _IconBackground(
            icon: Icons.games_outlined,
            color: iconColor,
            left: 140,
            top: 650,
            rotation: 20),
      ]),
    );
  }

  BoxDecoration _redBackground() => const BoxDecoration(
      gradient: LinearGradient(
          colors: [Color.fromARGB(255, 234, 231, 231), Colors.grey]));
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
