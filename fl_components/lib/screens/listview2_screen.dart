import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  ListView2Screen({Key? key}) : super(key: key);
  final List<String> options = [
    'Metal Gear',
    'Howorts Legacy',
    'Gears Of War',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          title: const Text(
            'ListView 2',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (_, index) => ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {},
          ),
          separatorBuilder: (_, index) => const Divider(),
        ));
  }
}
