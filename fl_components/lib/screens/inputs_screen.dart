import 'screens.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs & Text'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(children: const [
            CustomInputField(
              helperText: 'Enter a Name',
              labelText: 'Name',
              icon: Icons.people,
            ),
            SizedBox(
              height: 10,
            ),
            CustomInputField(
              helperText: 'Enter a valid email',
              labelText: 'Email',
              icon: Icons.email,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            CustomInputField(
              labelText: 'Password',
              icon: Icons.password,
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
