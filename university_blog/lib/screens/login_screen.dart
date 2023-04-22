import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../ui/ui.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            Separators.separatorV(250),
            CardContainer(
              child: Column(
                children: [
                  Separators.separatorV(10),
                  Text(
                    'Ingreso',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Separators.separatorV(30),
                  ChangeNotifierProvider(
                      create: (_) => LoginProvider(), child: const _LoginForm())
                ],
              ),
            ),
            Separators.separatorV(50),
            const Text('Crear una cuenta'),
            Separators.separatorV(50),
          ]),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  final String emailPattern = '^[A-Za-z0-9._%+-]+@unilibre.edu.co';
  final String emailError = 'El correo debe ser institucional @unilibre.edu.co';
  final String emailHintText = 'rafaela-ramirezs@unilibre.edu.co';
  final String emailLabelText = 'Correo Universitario';

  final String passwordError = 'La contraseña mínima es de 6 caracteres';
  final String passwordHintText = '*******';
  final String passwordLabelText = 'Contraseña';

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
                RegExp regExp = RegExp(emailPattern);
                return regExp.hasMatch(email ?? '') ? null : emailError;
              },
              onChanged: (email) => loginForm.email = email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              initialValue: 'rafaela-ramirezs@unilibre.edu.co',
              decoration: InputDecorations.authInputDecoration(
                  hintText: emailHintText,
                  labelText: emailLabelText,
                  icon: Icons.alternate_email_sharp),
            ),
            Separators.separatorV(20),
            TextFormField(
              validator: (password) {
                return (password != null && password.length > 6)
                    ? null
                    : passwordError;
              },
              onChanged: (password) => loginForm.password = password,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              initialValue: '1234567',
              decoration: InputDecorations.authInputDecoration(
                  hintText: passwordHintText,
                  labelText: passwordLabelText,
                  icon: Icons.password),
            ),
            Separators.separatorV(30),
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
                Navigator.pushReplacementNamed(context, Routes.homeScreen);
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
