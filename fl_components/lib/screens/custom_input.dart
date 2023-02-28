import 'package:fl_components/screens/screens.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
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
          labelText: 'Name'),
    );
  }
}
