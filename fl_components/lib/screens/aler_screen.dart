import 'dart:io';

import 'package:fl_components/models/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayAlertIOS(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Row(
              children: const [
                Icon(
                  Icons.warning,
                  size: 25,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Alert!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Hello again my princes 🌷',
                    style: TextStyle(fontSize: 17)),
                SizedBox(height: 10)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(fontSize: 17, color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 17),
                  ))
            ],
          );
        });
  }

  void displayAlertAndroid(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Row(
              children: const [
                Icon(
                  Icons.warning,
                  size: 25,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Alert!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Hello again my princes 🌷'),
                SizedBox(height: 10)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(fontSize: 17, color: AppTheme.primary),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              shape: const StadiumBorder(),
              elevation: 0),
          onPressed: () {
            Platform.isAndroid
                ? displayAlertAndroid(context)
                : displayAlertIOS(context);
          },
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text('Show Alert')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.primary,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close)),
    );
  }
}
