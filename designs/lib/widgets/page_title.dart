import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 10,
              ),
              Text(
                'Clasifique su Transacción',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text('By Rafael Ramirez',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 218, 218, 218))),
            ]),
      ),
    );
  }
}
