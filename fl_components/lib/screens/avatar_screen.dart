import 'package:fl_components/models/app_theme.dart';
import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rafael Ramirez'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: const Text(
                'RR',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            maxRadius: 160,
            backgroundImage: AssetImage('assets/rr.jpg'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Software Engineer', style: TextStyle(fontSize: 18)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Scotiabank',
                      style: TextStyle(color: Colors.red, fontSize: 17),
                    ),
                  ],
                ),
                const Text('Libre University', style: TextStyle(fontSize: 17)),
                const Text('Bogotá, D.C.', style: TextStyle(fontSize: 17)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.link),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '@jafaael',
                      style: TextStyle(color: AppTheme.primary, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
