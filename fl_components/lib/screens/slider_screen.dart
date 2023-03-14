import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
              min: 50,
              max: 500,
              value: _sliderValue,
              onChanged: (value) {
                _sliderValue = value;
                setState(() {});
              }),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                    fit: BoxFit.contain,
                    width: _sliderValue,
                    image: const NetworkImage(
                        'https://i.pinimg.com/originals/77/ad/fb/77adfbce60a9c286ffd0f76545aeadfe.jpg')),
              ))
        ],
      ),
    );
  }
}
