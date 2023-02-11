import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  ListView1Screen({Key? key}) : super(key: key);
  final List<String> options = ['Metal Gear', 'Howorts Legacy', 'Gears Of War'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          title: const Text(
            'ListView 1',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            ...options
                .map((e) => ListTile(
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      title: Text(e),
                    ))
                .toList()
          ],
        ));
  }
}
