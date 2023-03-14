import 'screens.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey();

    final Map<String, String> formValues = {
      'name': 'Rafael',
      'email': 'raframzs@gmail.com',
      'password': '123456',
      'role': 'Admin'
    };

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
          child: Form(
            key: form,
            child: Column(children: [
              CustomInputField(
                helperText: 'Enter a Name',
                labelText: 'Name',
                formProperty: 'name',
                formValues: formValues,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomInputField(
                helperText: 'Enter a valid email',
                labelText: 'Email',
                textInputType: TextInputType.emailAddress,
                formProperty: 'email',
                formValues: formValues,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomInputField(
                labelText: 'Password',
                obscureText: true,
                formProperty: 'password',
                formValues: formValues,
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'admin',
                      child: Text('Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'superuser',
                      child: Text('Superuser'),
                    ),
                    DropdownMenuItem(
                      value: 'developer',
                      child: Text('Developer'),
                    ),
                    DropdownMenuItem(
                      value: 'junior',
                      child: Text('Jr. Developer'),
                    )
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  }),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text('Guardar'),
                      )),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!form.currentState!.validate()) return;
                    print(formValues);
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
