import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  plusOne() {
    counter++;
    setState(() {});
  }

  minusOne() {
    counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Número de Clicks',
                style: textStyle,
              ),
              Text('$counter', style: textStyle)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            CustomFloatingActions(plusClicks: plusOne, minusClicks: minusOne));
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function plusClicks;
  final Function minusClicks;

  const CustomFloatingActions({
    super.key,
    required this.plusClicks,
    required this.minusClicks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => minusClicks(),
          backgroundColor: Colors.redAccent,
          child: const Icon(
            Icons.exposure_minus_1,
            size: 35,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
            onPressed: () => plusClicks(),
            child: const Icon(
              Icons.plus_one,
              size: 35,
            ))
      ],
    );
  }
}
