import 'package:flutter/material.dart';
import 'package:university_blog/screens/home.dart';
import 'package:university_blog/widgets/widgets.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo.png',
          scale: 5,
        ),
        const SizedBox(
          height: 50,
        ),
        const InputLoginScreen(name: 'Correo Universitario'),
        const SizedBox(
          height: 20,
        ),
        const InputLoginScreen(
          name: 'Contraseña',
          obscureText: true,
        ),
        Button(
            height: 100,
            width: 480,
            padding: const EdgeInsets.all(20),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                )),
        TextButton(
          onPressed: () {},
          child: Text(
            '¿Olvido su contraseña?',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
