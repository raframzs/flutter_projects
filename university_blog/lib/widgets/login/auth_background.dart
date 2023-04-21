import 'package:flutter/material.dart';

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
          children: [const _RedBox(), const _Logo(), child]),
    );
  }
}

class _RedBox extends StatelessWidget {
  const _RedBox();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _redBackground(),
      child: Stack(children: const [
        Positioned(
          top: 90,
          left: 30,
          child: _RedCircles(),
        ),
        Positioned(
          top: 20,
          left: 300,
          child: _RedCircles(),
        ),
        Positioned(
          top: 190,
          left: 180,
          child: _RedCircles(),
        ),
        Positioned(
          top: 290,
          left: 5,
          child: _RedCircles(),
        ),
        Positioned(
          top: 250,
          left: 340,
          child: _RedCircles(),
        ),
      ]),
    );
  }

  BoxDecoration _redBackground() => const BoxDecoration(
      gradient: LinearGradient(
          colors: [Color.fromARGB(255, 225, 40, 62), Color(0xffe2001a)]));
}

class _RedCircles extends StatelessWidget {
  const _RedCircles();

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

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 80),
      child: CircleAvatar(
        maxRadius: 50,
        backgroundColor: Color(0xffc19900),
        backgroundImage: AssetImage('assets/logo.png'),
      ),
    );
  }
}
