import 'package:flutter/material.dart';
import 'package:university_blog/screens/home.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              '/Users/rafaelramirez/Documents/develop/flutter-projects/university_blog/assets/icon/logo.png',
              scale: 5,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                scrollPadding: const EdgeInsets.only(bottom: 220),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'Correo Universitario',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                obscureText: true,
                scrollPadding: const EdgeInsets.only(bottom: 220),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  labelText: 'Contraseña',
                ),
              ),
            ),
            Container(
                height: 100,
                width: 480,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
                  child: const Text('Log In'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                )),
            TextButton(
              onPressed: () {},
              child: Text(
                '¿Olvido su contraseña?',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
