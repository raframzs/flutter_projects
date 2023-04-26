import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/app_theme.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
          alignment: Alignment.topCenter,
          children: [const _LoginBackground(), const _Logo(), child]),
    );
  }
}

class _LoginBackground extends StatelessWidget {
  const _LoginBackground();

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: appTheme.appBarBackground)),
      child: Stack(children: const [
        Positioned(
          top: 90,
          left: 30,
          child: _BackgroundCircle(),
        ),
        Positioned(
          top: 20,
          left: 300,
          child: _BackgroundCircle(),
        ),
        Positioned(
          top: 190,
          left: 180,
          child: _BackgroundCircle(),
        ),
        Positioned(
          top: 290,
          left: 5,
          child: _BackgroundCircle(),
        ),
        Positioned(
          top: 250,
          left: 340,
          child: _BackgroundCircle(),
        ),
      ]),
    );
  }
}

class _BackgroundCircle extends StatelessWidget {
  const _BackgroundCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.085)),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  final String logoPath = 'assets/logo.png';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: CircleAvatar(
        maxRadius: 50,
        backgroundColor: const Color(0xffc19900),
        backgroundImage: AssetImage(logoPath),
      ),
    );
  }
}
