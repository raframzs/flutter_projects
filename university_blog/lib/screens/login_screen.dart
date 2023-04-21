import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/providers/login_provider.dart';
import 'package:university_blog/ui/input_decorations.dart';
import 'package:university_blog/widgets/login/auth_background.dart';
import 'package:university_blog/widgets/login/card_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ingreso',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider(
                      create: (_) => LoginProvider(), child: const _LoginForm())
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('Crear una cuenta'),
            const SizedBox(
              height: 50,
            ),
          ]),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              validator: (email) {
                String pattern = '^[A-Za-z0-9._%+-]+@unilibre.edu.co';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(email ?? '')
                    ? null
                    : 'El correo debe ser institucional @unilibre.edu.co';
              },
              onChanged: (email) => loginForm.email = email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              //initialValue: 'rafaela-ramirezs@unilibre.edu.co',
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'rafaela-ramirezs@unilibre.edu.co',
                  labelText: 'Correo Universitario',
                  icon: Icons.alternate_email_sharp),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (password) {
                return (password != null && password.length > 6)
                    ? null
                    : 'La contraseña mínima es de 6 caracteres';
              },
              onChanged: (password) => loginForm.password = password,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              //initialValue: '1234567',
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*******',
                  labelText: 'Contraseña',
                  icon: Icons.password),
            ),
            const SizedBox(
              height: 30,
            ),
            _LoginButton(loginForm: loginForm)
          ],
        ));
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.loginForm,
  });

  final LoginProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loginForm.isLoading
          ? null
          : () async {
              FocusScope.of(context).unfocus();
              if (loginForm.isValidForm()) {
                loginForm.isLoading = true;
                await Future.delayed(const Duration(seconds: 2));
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'home');
              }
            },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      disabledColor: Colors.grey,
      color: const Color(0xffe2001a),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: loginForm.isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xffe2001a),
                ),
              )
            : const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
