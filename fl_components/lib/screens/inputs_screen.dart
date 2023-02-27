import 'package:flutter/material.dart';

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
          child: Column(children: [
            TextFormField(
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              initialValue: '',
              // ignore: avoid_print
              onChanged: (value) => print(value),
              validator: (value) {
                if (value == null) return "Field is Required";
                return value.length < 3 ? "Min lenght is 3" : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.usb,
                    size: 35,
                  ),
                  hintText: 'Name of the user',
                  helperText: 'Minimun 3 characters',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10)))),
            )
          ]),
        ),
      ),
    );
  }
}
