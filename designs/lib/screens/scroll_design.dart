import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          scrollDirection: Axis.vertical, children: const [Page1(), Page2()]),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [_Background(), _MainContent()],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: const Color(0xff51c1dd),
        alignment: Alignment.topCenter,
        child: const Image(image: AssetImage('assets/scroll.png')));
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            '11°',
            style: textStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Lunes',
            style: textStyle,
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff51c1dd),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: Colors.white, shape: const StadiumBorder()),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              'Click',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
