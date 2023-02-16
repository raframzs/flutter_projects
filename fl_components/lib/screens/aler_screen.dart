import 'package:fl_components/models/app_theme.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayAlert(BuildContext context) {
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
                  'Hey Princess!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('You must know, Rafael loves you. 🌷'),
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
            displayAlert(context);
          },
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text('Show Alert')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close)),
    );
  }
}
